//
//  MatchModel.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/13/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation

struct HomeTeam: Codable {
    var teamID: Int
    var logo: String
    var teamName: String
    
    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case logo
        case teamName = "team_name"

    }
}

struct AwayTeam: Codable {
    var teamID: Int
    var logo: String
    var teamName: String
    
    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case logo
        case teamName = "team_name"
        
    }
}

struct MatchModel: Codable {
    var homeTeam: HomeTeam
    var awayTeam: AwayTeam
    var goalsAwayTeam: Int
    var goalsHomeTeam: Int
    var statusShort: String
    var round: String
}

struct ApiResponse: Codable {
    let results: Int
    let fixtures: [MatchModel]
}

struct Meta: Codable {
    let api: ApiResponse
}
