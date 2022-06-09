//
//  ChampionDetailViewController.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import UIKit
import RxSwift
import RxCocoa

final class ChampionDetailViewController: UIViewController {

    let disposeBag = DisposeBag()

    let championDetailView = ChampionDetailView()

    var viewModel: ChampionDetailViewModel!

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        bindViewModel()
    }

    // MARK: - function

    private func setView() {
        view.backgroundColor = .white
        championDetailView.tableView.register(ChampionDetailCell.self, forCellReuseIdentifier: "cellId")
        championDetailView.tableView.rx.setDelegate(self).disposed(by: disposeBag)

        view.addSubview(championDetailView)

        championDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        championDetailView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        championDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        championDetailView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    private func bindViewModel() {
        let input = ChampionDetailViewModel.Input(id: viewModel.championId)
        let output = viewModel.transform(input: input)

        output.detail
            .asObservable()
            .bind(to: championDetailView.tableView.rx.items(cellIdentifier: "cellId", cellType: ChampionDetailCell.self)) { index, item, cell in
                if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(item.id)_0.jpg") {
                    cell.championImageView.kf.setImage(with: url)
                }

                if let passiveUrl = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.11.1/img/passive/\(item.passive.image.full)") {
                    cell.championSpellPassiveImageView.kf.setImage(with: passiveUrl)
                    cell.championSpellPassiveNameLabel.text = item.passive.name
                    cell.championSpellPassiveDescriptionLabel.text = item.passive.description
                }

                for index in 0...3 {
                    switch index {
                    case 0:
                        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/spell/\(item.spells[index].id).png") {
                            cell.championSpellQImageView.kf.setImage(with: url)
                            cell.championSpellQNameLabel.text = item.spells[index].name
                            cell.championSpellQDescriptionLabel.text = item.spells[index].description
                        }
                    case 1:
                        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/spell/\(item.spells[index].id).png") {
                            cell.championSpellWImageView.kf.setImage(with: url)
                            cell.championSpellWNameLabel.text = item.spells[index].name
                            cell.championSpellWDescriptionLabel.text = item.spells[index].description
                        }
                    case 2:
                        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/spell/\(item.spells[index].id).png") {
                            cell.championSpellEImageView.kf.setImage(with: url)
                            cell.championSpellENameLabel.text = item.spells[index].name
                            cell.championSpellEDescriptionLabel.text = item.spells[index].description
                        }
                    case 3:
                        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/spell/\(item.spells[index].id).png") {
                            cell.championSpellRImageView.kf.setImage(with: url)
                            cell.championSpellRNameLabel.text = item.spells[index].name
                            cell.championSpellRDescriptionLabel.text = item.spells[index].description
                        }
                    default:
                        break
                    }
                }

                cell.championNameLabel.text = item.name
                cell.championTitleLabel.text = item.title
                cell.championLoreLabel.text = item.lore

                var allyTipsText = "ALLY:\n"
                item.allytips.forEach { allyTipsText += "\($0)\n\n" }
                cell.allyTipsLabel.text = allyTipsText

                var enemyTipsText = "ENEMY:\n"
                item.enemytips.forEach { enemyTipsText += "\($0)\n\n" }
                cell.enemyTipsLabel.text = enemyTipsText
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - extension

extension ChampionDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
