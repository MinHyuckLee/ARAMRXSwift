//
//  Champion.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/06/07.
//

import Foundation

struct Champion: Codable {
    let type: String
    let format: String
    let version: String
    let data: ChampionData
}

struct ChampionData: Codable {
    let Aatrox: ChampionInfo
    let Ahri: ChampionInfo
    let Akali: ChampionInfo
    let Akshan: ChampionInfo
    let Alistar: ChampionInfo
    let Amumu: ChampionInfo
    let Anivia: ChampionInfo
    let Annie: ChampionInfo
    let Aphelios: ChampionInfo
    let Ashe: ChampionInfo
    let AurelionSol: ChampionInfo
    let Azir: ChampionInfo
    let Bard: ChampionInfo
    let Belveth: ChampionInfo
    let Blitzcrank: ChampionInfo
    let Brand: ChampionInfo
    let Braum: ChampionInfo
    let Caitlyn: ChampionInfo
    let Camille: ChampionInfo
    let Cassiopeia: ChampionInfo
    let Chogath: ChampionInfo
    let Corki: ChampionInfo
    let Darius: ChampionInfo
    let Diana: ChampionInfo
    let Draven: ChampionInfo
    let DrMundo: ChampionInfo
    let Ekko: ChampionInfo
    let Elise: ChampionInfo
    let Evelynn: ChampionInfo
    let Ezreal: ChampionInfo
    let Fiddlesticks: ChampionInfo
    let Fiora: ChampionInfo
    let Fizz: ChampionInfo
    let Galio: ChampionInfo
    let Gangplank: ChampionInfo
    let Garen: ChampionInfo
    let Gnar: ChampionInfo
    let Gragas: ChampionInfo
    let Graves: ChampionInfo
    let Gwen: ChampionInfo
    let Hecarim: ChampionInfo
    let Heimerdinger: ChampionInfo
    let Illaoi: ChampionInfo
    let Irelia: ChampionInfo
    let Ivern: ChampionInfo
    let Janna: ChampionInfo
    let JarvanIV: ChampionInfo
    let Jax: ChampionInfo
    let Jayce: ChampionInfo
    let Jhin: ChampionInfo
    let Jinx: ChampionInfo
    let Kaisa: ChampionInfo
    let Kalista: ChampionInfo
    let Karma: ChampionInfo
    let Karthus: ChampionInfo
    let Kassadin: ChampionInfo
    let Katarina: ChampionInfo
    let Kayle: ChampionInfo
    let Kayn: ChampionInfo
    let Kennen: ChampionInfo
    let Khazix: ChampionInfo
    let Kindred: ChampionInfo
    let Kled: ChampionInfo
    let KogMaw: ChampionInfo
    let Leblanc: ChampionInfo
    let LeeSin: ChampionInfo
    let Leona: ChampionInfo
    let Lillia: ChampionInfo
    let Lissandra: ChampionInfo
    let Lucian: ChampionInfo
    let Lulu: ChampionInfo
    let Lux: ChampionInfo
    let Malphite: ChampionInfo
    let Malzahar: ChampionInfo
    let Maokai: ChampionInfo
    let MasterYi: ChampionInfo
    let MissFortune: ChampionInfo
    let MonkeyKing: ChampionInfo
    let Mordekaiser: ChampionInfo
    let Morgana: ChampionInfo
    let Nami: ChampionInfo
    let Nasus: ChampionInfo
    let Nautilus: ChampionInfo
    let Neeko: ChampionInfo
    let Nidalee: ChampionInfo
    let Nocturne: ChampionInfo
    let Nunu: ChampionInfo
    let Olaf: ChampionInfo
    let Orianna: ChampionInfo
    let Ornn: ChampionInfo
    let Pantheon: ChampionInfo
    let Poppy: ChampionInfo
    let Pyke: ChampionInfo
    let Qiyana: ChampionInfo
    let Quinn: ChampionInfo
    let Rakan: ChampionInfo
    let Rammus: ChampionInfo
    let RekSai: ChampionInfo
    let Rell: ChampionInfo
    let Renata: ChampionInfo
    let Renekton: ChampionInfo
    let Rengar: ChampionInfo
    let Riven: ChampionInfo
    let Rumble: ChampionInfo
    let Ryze: ChampionInfo
    let Samira: ChampionInfo
    let Sejuani: ChampionInfo
    let Senna: ChampionInfo
    let Seraphine: ChampionInfo
    let Sett: ChampionInfo
    let Shaco: ChampionInfo
    let Shen: ChampionInfo
    let Shyvana: ChampionInfo
    let Singed: ChampionInfo
    let Sion: ChampionInfo
    let Sivir: ChampionInfo
    let Skarner: ChampionInfo
    let Sona: ChampionInfo
    let Soraka: ChampionInfo
    let Swain: ChampionInfo
    let Sylas: ChampionInfo
    let Syndra: ChampionInfo
    let TahmKench: ChampionInfo
    let Taliyah: ChampionInfo
    let Talon: ChampionInfo
    let Taric: ChampionInfo
    let Teemo: ChampionInfo
    let Thresh: ChampionInfo
    let Tristana: ChampionInfo
    let Trundle: ChampionInfo
    let Tryndamere: ChampionInfo
    let TwistedFate: ChampionInfo
    let Twitch: ChampionInfo
    let Udyr: ChampionInfo
    let Urgot: ChampionInfo
    let Varus: ChampionInfo
    let Vayne: ChampionInfo
    let Veigar: ChampionInfo
    let Velkoz: ChampionInfo
    let Vex: ChampionInfo
    let Vi: ChampionInfo
    let Viego: ChampionInfo
    let Viktor: ChampionInfo
    let Vladimir: ChampionInfo
    let Volibear: ChampionInfo
    let Warwick: ChampionInfo
    let Xayah: ChampionInfo
    let Xerath: ChampionInfo
    let XinZhao: ChampionInfo
    let Yasuo: ChampionInfo
    let Yone: ChampionInfo
    let Yorick: ChampionInfo
    let Yuumi: ChampionInfo
    let Zac: ChampionInfo
    let Zed: ChampionInfo
    let Zeri: ChampionInfo
    let Ziggs: ChampionInfo
    let Zilean: ChampionInfo
    let Zoe: ChampionInfo
    let Zyra: ChampionInfo
}

struct ChampionInfo: Codable {
    let version: String
    let id: String
    let key: String
    let name: String
    let title: String
    let blurb: String
    let info: ChampionBasicInfo
    let image: ChampionImage
    let tags: [String]
    let partype: String
    let stats: ChampionStats
}

struct ChampionBasicInfo: Codable {
    let attack: Int
    let defense: Int
    let magic: Int
    let difficulty: Int
}

struct ChampionImage: Codable {
    let full: String
    let sprite: String
    let group: String
    let x: Int
    let y: Int
    let w: Int
    let h: Int
}

struct ChampionStats: Codable {
    let hp: Double
    let hpperlevel: Double
    let mp: Double
    let mpperlevel: Double
    let movespeed: Double
    let armor: Double
    let armorperlevel: Double
    let spellblock: Double
    let spellblockperlevel: Double
    let attackrange: Double
    let hpregen: Double
    let hpregenperlevel: Double
    let mpregen: Double
    let mpregenperlevel: Double
    let crit: Double
    let critperlevel: Double
    let attackdamage: Double
    let attackdamageperlevel: Double
    let attackspeedperlevel: Double
    let attackspeed: Double
}
