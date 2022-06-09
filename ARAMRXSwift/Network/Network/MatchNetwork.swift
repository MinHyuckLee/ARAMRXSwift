//
//  MatchNetwork.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/09.
//

import Moya
import RxSwift
import RxCocoa

final class MatchNetwork {

    private let provider = MoyaProvider<MatchService>()

    func getMatchId(puuId: String) -> Driver<[String]> {
        return provider.rx.request(.matchId(puuId: puuId))
            .map([String].self, using: JSONDecoder())
            .asDriver(onErrorDriveWith: .never())
    }

    func getMatch(matchId: String) -> Driver<Match> {
        return provider.rx.request(.match(matchId: matchId))
            .map(Match.self, using: JSONDecoder())
            .asDriver(onErrorDriveWith: .never())
    }
}
