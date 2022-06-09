//
//  ChampionService.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/07.
//

import Moya

enum ChampionService {
    case champion(version: String, lang: String)
}

extension ChampionService: TargetType {
    var baseURL: URL {
        return URL(string: "http://ddragon.leagueoflegends.com")!
    }

    var path: String {
        switch self {
        case .champion(let version, let lang):
            return "/cdn/\(version)/data/\(lang)/champion.json"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
