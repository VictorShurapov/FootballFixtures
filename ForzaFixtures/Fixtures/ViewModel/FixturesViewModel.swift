//
//  FixturesViewModel.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/12/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation
import Moya
import Cachable

class FixturesViewModel {
    
    // MARK: - Properties
    var fixtures = [MatchModel]()
    var currentRound = "1/8"
    var mathesForRound = [MatchModel]()
    
    // MARK: - MoyaProvider
    let provider = MoyaProvider<ForzaFixturesAPI>()
    
    // MARK: - Cacher
    // Create a cacher and use the temporary directory
    let cacher: Cacher = Cacher(destination: .temporary)
    
    // MARK: - Methods
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
            mathesForRound = fixtures.filter { $0.round == finalRoundNameSplits[0] || $0.round == finalRoundNameSplits[1] }
        } else {
            // If it is just a normal round we can filter it by its name
            mathesForRound = fixtures.filter { $0.round == round }
        }
    }
    
    func getFixturesForWorldCup(completion: @escaping () -> Void, errorDescription: @escaping (_ description: String) -> Void) {
        
        // Check for fixtures in cache
        if let fixturesData: FixturesData = cacher.load(fileName: "worldCupFixtures") {
            // Populate fixtures with the cached one
            fixtures = fixturesData.fixtures
            completion()
        } else {
            // If there are no fixtures in cache
            // download them from server and write to cache
            // default legue is world cup with ID number 1
            provider.request(.getFixturesForLegueWith(id: 1)) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        
                        let apiResponse = try decoder.decode(Meta.self, from: response.data).api
                        self.writeToCache(fixturesData: apiResponse)
                        
                        self.fixtures = apiResponse.fixtures
                        
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
        }
    }
    
    func writeToCache(fixturesData: FixturesData) {
        cacher.persist(item: fixturesData) { url, error in
            if let error = error {
                print("Fixtures data failed to persist: \(error)")
            } else {
                print("Fixtures data persisted in \(String(describing: url))")
            }
        }
    }
}
