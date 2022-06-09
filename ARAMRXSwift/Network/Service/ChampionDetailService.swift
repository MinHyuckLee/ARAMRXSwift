//
//  ChampionDetailService.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import Moya

enum ChampionDetailService {
    case champion(version: String, lang: String, id: String)
}

extension ChampionDetailService: TargetType {
    var baseURL: URL {
        return URL(string: "http://ddragon.leagueoflegends.com")!
    }

    var path: String {
        switch self {
        case .champion(let version, let lang, let id):
            return "/cdn/\(version)/data/\(lang)/champion/\(id).json"
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
