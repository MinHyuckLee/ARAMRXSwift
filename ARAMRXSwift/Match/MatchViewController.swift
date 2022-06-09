//
//  MatchViewController.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/13.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class MatchViewController: UIViewController {

    let disposeBag = DisposeBag()

    private let matchView = MatchView()

    var viewModel: MatchViewModel!

    private let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ParticipantInfo>> { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        switch item {
        case .champion(let champ):
            cell.textLabel?.text = champ
        case .level(let level):
            cell.textLabel?.text = "LEVEL: \(level)"
        case .kda(let kda):
            cell.textLabel?.text = "KDA: \(kda)"
        }
        return cell
    }

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setTableView()
        bindViewModel()
    }

    // MARK: - function

    private func setView() {
        view.backgroundColor = .white

        matchView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")

        view.addSubview(matchView)

        matchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        matchView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        matchView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        matchView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    private func setTableView() {

        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].model
        }

        dataSource.titleForFooterInSection = { dataSource, index in
          return nil
        }

        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
          return true
        }

        dataSource.canMoveRowAtIndexPath = { dataSource, indexPath in
          return true
        }
    }

    private func bindViewModel() {

        let input = MatchViewModel.Input(matchId: viewModel.matchId.asDriver())
        let output = viewModel.transform(input: input)

        output.section
            .asObservable()
            .bind(to: matchView.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        Observable.combineLatest(matchView.tableView.rx.itemSelected, output.match.asObservable())
            .flatMap { indexPath, model -> Observable<ActionType> in
                self.matchView.tableView.deselectRow(at: indexPath, animated: true)
                return self.showAlert(title: model.info.participants[indexPath.section].summonerName, message: model.info.participants[indexPath.section].championName)
            }
            .subscribe(onNext: { type in
                print(type)
            })
            .disposed(by: disposeBag)
    }
}

enum ActionType {
    case ok
    case cancel
}

extension MatchViewController {

    func showAlert(title: String, message: String? = nil) -> Observable<ActionType> {
        return Observable.create { [weak self] observer in

            guard let self = self else { return Disposables.create() }

            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                observer.onNext(.ok)
                observer.onCompleted()
            }

            alertVC.addAction(action)

            self.present(alertVC, animated: true)

            return Disposables.create {
                alertVC.dismiss(animated: true)
            }
        }
    }
}
