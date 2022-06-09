//
//  SearchService.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/04/26.
//

import Moya

let apiKey = "RGAPI-d9588327-b703-42fc-8fc6-87eea671073a"

enum SearchService {
    case searchSummoner(summonerName: String)
    case summonerImage(id: String)
}

extension SearchService: TargetType {
    var baseURL: URL {
        switch self {
        case .searchSummoner:
            return URL(string: "https://kr.api.riotgames.com")!
        case .summonerImage:
            return URL(string: "http://ddragon.leagueoflegends.com/cdn/12.8.1")!
        }
    }

    var path: String {
        switch self {
        case .searchSummoner(let summonerName):
            return "/lol/summoner/v4/summoners/by-name/\(summonerName)"
        case .summonerImage(let id):
            return "/img/profileicon/\(id).png"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        switch self {
        case .searchSummoner:
            let param: [String: Any] = ["api_key": apiKey]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .summonerImage:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
