//
//  ForzaFixturesAPI.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/13/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation
import Moya

enum ForzaFixturesAPI {
    
    // MARK: - ForzaFixturesAPI
    case getFixturesForLegueWith(id: Int)
}

extension ForzaFixturesAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api-football-v1.p.rapidapi.com/v2/")!
    }
    
    var path: String {
        switch self {
        case .getFixturesForLegueWith(let id):
            return "fixtures/league/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getFixturesForLegueWith:
            return .get
        }
    }
    
    var task: Task {
        switch self {
            
        case .getFixturesForLegueWith(id: _):
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        
        switch self {
            
        case .getFixturesForLegueWith(id: _):
            return ["x-rapidapi-host": "api-football-v1.p.rapidapi.com",
                    "x-rapidapi-key": "f5572b3dd3msh0408bbfb3edf693p102451jsn3eb0be640e9b",
                    "Content-type": "application/json"]
        }
    }
}
