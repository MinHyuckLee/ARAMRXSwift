//
//  RankService.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/03.
//

import Moya

enum RankService {
    case rank(id: String)
}

extension RankService: TargetType {
    var baseURL: URL {
        return URL(string: "https://kr.api.riotgames.com")!
    }

    var path: String {
        switch self {
        case .rank(let id):
            return "/lol/league/v4/entries/by-summoner/\(id)"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        let param: [String: Any] = ["api_key": apiKey]
        return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
    }

    var headers: [String: String]? {
        return nil
    }
}
