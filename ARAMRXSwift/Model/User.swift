//
//  User.swift
//  ARAMRXSwift
//
//  Created by Min on 2022/04/26.
//

import Foundation

/*
"id": "BP1LeLmy9y5o0PYY2j7zPb48FHCyXf4hWzOy_ODQ8csy8rw",
"accountId": "ypW3PDpFFtI2EZwpXx6OdR4itoThto1DdM0eUGKUpB1tIr0",
"puuid": "f6krSm6z1yD8Hc8-n9X_QkbjKRVNvOPmiUCgUnnSIr82ziFkJbe1ZXPs67PUbe0gkkUNbWm_PwU9GQ",
"name": "은밀하게밝혀라",
"profileIconId": 5021,
"revisionDate": 1651394784000,
"summonerLevel": 296

 "id": "-6yWbzr4yqapymNEs4-hmADsG8rKOaePN4zjQTsULaftmA",
 "accountId": "KRCn4ul6Ttd5zff2PluqB6yaIPtIAtOZTnW0He0bqO_e",
 "puuid": "bPaeMI_29CFN95MbHQdOS0BiOPcSgJMAZK41mHI9cZNO14OdU7fQNqK84BNMSwF3I5Yjre13WVPIuQ",
 "name": "골없칸왕",
 "profileIconId": 7,
 "revisionDate": 1651412462000,
 "summonerLevel": 323
*/

struct User: Codable {
    var id: String
    var accountId: String
    var puuid: String
    var name: String
    var profileIconId: Int
    var revisionDate: Int
    var summonerLevel: Int
}
