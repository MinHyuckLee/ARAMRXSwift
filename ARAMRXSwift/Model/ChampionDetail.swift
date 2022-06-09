//
//  ChampionDetail.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/08.
//

import Foundation

struct ChampionDetail: Codable {
    let id: String
    let key:  String
    let name: String
    let title: String
    let lore: String
    let allytips: [String]
    let enemytips: [String]
    let tags: [String]
    let partype: String
    let info: ChampionBasicInfo
    let stats: ChampionStats
    let spells: [ChampionSpells]
    let passive: ChampionPassive
}

struct ChampionSpells: Codable {
    let id: String
    let name: String
    let description: String
    let tooltip: String
}

struct ChampionPassive: Codable {
    let name: String
    let description: String
    let image:ChampionImage
}
