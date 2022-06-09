//
//  ChampionDetailNetwork.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import Moya
import RxSwift
import RxCocoa

final class ChampionDetailNetwork {

    let provider = MoyaProvider<ChampionDetailService>()

    func getChampionDetail(id: String) -> Driver<[ChampionDetail]> {
        return provider.rx.request(.champion(version: "12.11.1", lang: "ko_KR", id: id))
            .map(ChampionDetail.self, atKeyPath: "data.\(id)", using: JSONDecoder(), failsOnEmptyData: false)
            .map {[$0]}
            .asDriver(onErrorDriveWith: .never())
    }
}

// MARK: - important

// 아래 코드처럼 "data"에 키값 안에 있는 "id" 값을 파싱할때 rxMoya에서 제공하는 keypath에서 .으로 타고타고 들어갈 수 있음

//            .map({ response in
//                if let jsonData = try? response.mapJSON() as? [String: Any],
//                   let data = jsonData["data"] as? [String: Any], let champion = data["\(id)"] as? ChampionDetail {
//                    let jsonData = try? JSONSerialization.data(withJSONObject: data["\(id)"] as Any)
//                    let decode = try? JSONDecoder().decode(ChampionDetail.self, from: jsonData ?? Data())
//                    return champion
//                }
//                return .init(id: "", key: "", name: "", title: "")
//            })
