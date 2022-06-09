//
//  ChampionDetailViewModel.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import Foundation
import RxSwift
import RxCocoa

struct ChampionDetailViewModel: ViewModelType {

    let network: ChampionDetailNetwork
    let championId: String

    init(id: String, network: ChampionDetailNetwork = ChampionDetailNetwork()) {
        self.network = network
        self.championId = id
    }

    struct Input {
        let id: String
    }

    struct Output {
        let detail: Driver<[ChampionDetail]>
    }

    func transform(input: Input) -> Output {

        return Output(detail: network.getChampionDetail(id: input.id))
    }
}
