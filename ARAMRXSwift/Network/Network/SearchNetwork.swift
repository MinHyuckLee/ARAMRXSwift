//
//  SearchNetwork.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/03.
//

import Moya
import RxSwift
import RxCocoa

final class SearchNetwork {

    let provider = MoyaProvider<SearchService>()

    func searchSummoner(name: String) -> Driver<User> {

        return provider.rx.request(.searchSummoner(summonerName: name))
            .map(User.self, using: JSONDecoder())
            .asObservable()
            .asDriver(onErrorDriveWith: .never())
    }

    func getProfileImage(id: String) -> Driver<URL> {
        return provider.rx.request(.summonerImage(id: id))
            .map({ response in
                return URL(string: response.request?.url?.absoluteString ?? "")!
            })
            .asDriver(onErrorDriveWith: .never())
            .debug()
    }
}

// MARK: - important

// mapping으로 여러가지 처리, 프린트문도 map으로 받아와서 처리 가능
