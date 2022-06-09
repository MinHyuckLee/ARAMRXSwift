//
//  MatchService.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/09.
//

import Moya

enum MatchService {
    case matchId(puuId: String)
    case match(matchId: String)
}

extension MatchService: TargetType {
    var baseURL: URL {
        return URL(string: "https://asia.api.riotgames.com")!
    }

    var path: String {
        switch self {
        case .matchId(let puuId):
            return "/lol/match/v5/matches/by-puuid/\(puuId)/ids"
        case .match(let matchId):
            return "/lol/match/v5/matches/\(matchId)"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        switch self {
        case .matchId:
            let param: [String: Any] = ["api_key": apiKey, "start": 0, "count": 20]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .match:
            let param: [String: Any] = ["api_key": apiKey]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
