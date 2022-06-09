//
//  Rank.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/05/03.
//

import Foundation

/*
"leagueId": "2c6405e7-eec4-46a8-9b56-b3444797da5d",
"queueType": "RANKED_SOLO_5x5",
"tier": "SILVER",
"rank": "III",
"summonerId": "-6yWbzr4yqapymNEs4-hmADsG8rKOaePN4zjQTsULaftmA",
"summonerName": "골없칸왕",
"leaguePoints": 17,
"wins": 24,
"losses": 34,
"veteran": false,
"inactive": false,
"freshBlood": false,
"hotStreak": false
*/

struct Rank: Codable {
    let leagueId: String?
    let queueType: String
    let tier: String?
    let rank: String?
    let summonerId: String
    let summonerName: String
    let leaguePoints: Int
    let wins: Int
    let losses: Int
    let veteran: Bool
    let inactive: Bool
    let freshBlood: Bool
    let hotStreak: Bool
}

// MARK: - important

// array형태로 내려오는 데이터 Decode 중 없는 키들은 옵셔널로 처리해서 decode 에러를 피하자
