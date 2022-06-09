//
//  RankNetwork.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/03.
//

import Moya
import RxSwift
import RxCocoa

final class RankNetwork {

    let provider = MoyaProvider<RankService>()

    func requestRank(id: String) -> Driver<[Rank]> {
        return provider.rx.request(.rank(id: id))
            .map([Rank].self, using: JSONDecoder())
            .asDriver(onErrorDriveWith: .never())
    }
}
