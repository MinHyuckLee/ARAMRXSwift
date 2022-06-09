//
//  ChampionNetwork.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/07.
//

import Moya
import RxSwift
import RxCocoa

final class ChampionNetwork {

    private let provider = MoyaProvider<ChampionService>()

    func getChampions() -> Driver<Champion> {
        return provider.rx.request(.champion(version: "12.11.1", lang: "ko_KR"))
            .map(Champion.self, using: JSONDecoder())
            .asDriver(onErrorDriveWith: .never())
    }
}
