//
//  HomeViewController.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/04/26.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
import RxDataSources
import Kingfisher

final class HomeViewController: UIViewController {

    private let homeView = HomeView()

    let disposeBag = DisposeBag()

    var viewModel: HomeViewModel!

    private let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>> { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = item
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationView()
        setView()
        setTableView()
        bindViewModel()
    }

    private func setNavigationView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .camera)
        navigationItem.rightBarButtonItem?.rx.tap
            .asDriver()
            .drive(onNext: { _ in
                let championViewController = ChampionViewController()
                let championViewModel = ChampionViewModel()
                championViewController.viewModel = championViewModel
                self.navigationController?.pushViewController(championViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }

    private func setView() {
        view.backgroundColor = .white

        let searchViewController = UISearchController(searchResultsController: nil)
        searchViewController.searchBar.placeholder = "ID를 적어주세요"
        navigationItem.searchController = searchViewController

        homeView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(homeView)

        homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        homeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        homeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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
        if let text = navigationItem.searchController?.searchBar.rx.text.orEmpty.asDriver() {
            let input = HomeViewModel.Input(searchText: text)
            let output = viewModel.transform(input: input)

            output.user
                .drive(onNext: { user in
                    self.homeView.nameLabel.text = "NAME: \(user.name)"
                    self.homeView.summonerLevelLabel.text = "LEVEL: \(user.summonerLevel)"
                })
                .disposed(by: disposeBag)

            output.profileImageUrl
                .drive(onNext: { url in
                    if let url = url {
                        self.homeView.profileImageView.kf.setImage(with: url)
                    }
                })
                .disposed(by: disposeBag)

            output.rank
                .drive(onNext: { ranks in
                    if let tier = ranks.first?.tier, let rank = ranks.first?.rank, let points = ranks.first?.leaguePoints {
                        self.homeView.rankLabel.text = "RANK: \(tier) \(rank)"
                        self.homeView.pointLabel.text = "POINTS: \(points)"
                    } else {
                        self.homeView.rankLabel.text = "RANK: UNRANKED"
                        self.homeView.pointLabel.text = "POINTS: 0"
                    }
                })
                .disposed(by: disposeBag)

            output.section
                .asObservable()
                .bind(to: homeView.tableView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)

            Observable.zip(homeView.tableView.rx.itemSelected, homeView.tableView.rx.modelSelected(String.self))
                .asDriver(onErrorDriveWith: .never())
                .drive(onNext: { [weak self] index, model in
                    guard let self = self else { return }
                    self.homeView.tableView.deselectRow(at: index, animated: true)
                    print("model.matchId: \(model), index: \(index)")
                    let matchViewController = MatchViewController()
                    let matchViewModel = MatchViewModel(matchId: .init(value: model))
                    matchViewController.viewModel = matchViewModel
                    self.navigationController?.pushViewController(matchViewController, animated: true)
                })
//                .bind { [weak self] index, model in
//                    guard let self = self else { return }
//                    self.homeView.tableView.deselectRow(at: index, animated: true)
//                    print("model.matchId: \(model), index: \(index)")
//                }
                .disposed(by: disposeBag)

            // Keyboard Notification Code
//            let willShowObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
//                .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0 }
//
//            let willHideObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
//                .map { noti -> CGFloat in 0 }
//
//            Observable.merge(willShowObservable, willHideObservable)
//                .map { height in
//                    return height
//                }
//                .subscribe(onNext: {
//                    print("notificationHeight: \($0)")
//
//                    var tvInset = self.homeView.tableView.contentInset
//                    tvInset.bottom = $0
//                    self.homeView.tableView.contentInset = tvInset
//
//                    var scrollInset = self.homeView.tableView.verticalScrollIndicatorInsets
//                    scrollInset.bottom = $0
//                    self.homeView.tableView.verticalScrollIndicatorInsets = scrollInset
//                })
//                .disposed(by: disposeBag)
        }
    }
}

// MARK: - important!

// rxTableView는 array만 취급

// tableView cellforRow 하는 다른 방법
//            output.user
//                .asObservable()
//                .bind(to: homeView.tableView.rx.items(cellIdentifier: "cellId", cellType: UITableViewCell.self)) { index, element, cell in
//                    print("element.name: \(element.name)")
//                    cell.textLabel?.text = element.name
//                }
//                .disposed(by: disposeBag)
