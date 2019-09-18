//
//  FixturesViewModel.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/12/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation
import Moya

class FixturesViewModel {
    
    var fixtures = [MatchModel]()
    var currentRound = "1/8"
    var mathesForRound = [MatchModel]()
    
    func getRoundNameFor(itemTag: Int) -> String? {
        switch itemTag {
        case 0:
            return "8th Finals"
        case 1:
            return "Quarter-finals"
        case 2:
            return "Semi-finals"
        case 3:
            return "Final, 3rd Place Final"
        default:
            return nil
        }
    }
    
    func getMatchesFor(round: String) {
        
        // If it is final round we have 2 matches within one tab
        // their names are separated by comma and whitespaces
        // so after split 'finalRoundNameSplits' array will contain 2 values: "Final" and "3rd_Place_Final"
        if round.contains(", ") {
            let finalRoundNameSplits = round.components(separatedBy: ", ")
            for roundName in finalRoundNameSplits {
                mathesForRound += fixtures.filter { $0.round == roundName }
            }
        } else {
            // If it is just a normal round we can filter it by its name
            mathesForRound = fixtures.filter { $0.round == round }
        }
    }
    
    let provider = MoyaProvider<ForzaFixturesAPI>()
    
    public func getFixturesForWorldCupWith(id: Int = 1, completion: @escaping () -> Void, errorDescription: @escaping (_ description: String) -> Void) {
        
        provider.request(.getFixturesForLegueWith(id: id)) { (result) in
            switch result {
            case .success(let response):
                
                do {
                    let decoder = JSONDecoder()
                    self.fixtures = try decoder.decode(Meta.self, from: response.data).api.fixtures
                    print("RTVSF")
                    completion()
                } catch let error {
                    errorDescription(error.localizedDescription)
                    print("An error occured: \(error)")
                }
            case .failure(let error):
                errorDescription(error.localizedDescription)
                print(error)
            }
        }
    }}
