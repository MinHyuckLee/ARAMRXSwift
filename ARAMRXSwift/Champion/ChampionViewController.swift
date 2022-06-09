//
//  ChampionViewController.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/07.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class ChampionViewController: UIViewController {

    let disposeBag = DisposeBag()

    let championView = ChampionView()

    var viewModel: ChampionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        bindViewModel()
    }

    private func setView() {
        view.backgroundColor = .white

        championView.collectionView.register(ChampionCell.self, forCellWithReuseIdentifier: "cellId")
        championView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        view.addSubview(championView)

        championView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        championView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        championView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        championView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    private func bindViewModel() {
        let input = ChampionViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.champion
            .asObservable()
            .bind(to: championView.collectionView.rx.items(cellIdentifier: "cellId", cellType: ChampionCell.self)) { index, champion, cell in
                if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.11.1/img/champion/\(champion.image.full)") {
                    cell.championImageView.kf.setImage(with: url)
                }
            }
            .disposed(by: disposeBag)

        Observable.combineLatest(championView.collectionView.rx.itemSelected, output.champion.asObservable())
            .map { index, model in
                self.championView.collectionView.deselectItem(at: index, animated: true)
                let championDetailViewController = ChampionDetailViewController()
                let championDetailViewModel = ChampionDetailViewModel(id: model[index.item].id)
                championDetailViewController.viewModel = championDetailViewModel
                self.navigationController?.pushViewController(championDetailViewController, animated: true)
            }
            .subscribe()
            .disposed(by: disposeBag)
    }
}


extension ChampionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.width / 5)
    }
}
