//
//  MatchTableViewCell.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/12/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit
import Kingfisher

class MatchTableViewCell: UITableViewCell {
    
    // MARK:- IBOutlets and IBActions

    @IBOutlet weak var matchStatus: UILabel!
    @IBOutlet weak var homeTeamGoals: UILabel!
    @IBOutlet weak var awayTeamGoals: UILabel!
    
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamFlag: UIImageView!
    @IBOutlet weak var awayTeamFlag: UIImageView!
    @IBAction func showMoreInfo(_ sender: Any) {
    }
    
    // MARK:- Properties
    private var currentModel: MatchModel!

    // MARK:- Methods
    func configured(withModel model: MatchModel) -> Self {
        
        currentModel = model
        
        matchStatus.text = currentModel.statusShort
        homeTeamGoals.text = String(currentModel.goalsHomeTeam)
        awayTeamGoals.text = String(currentModel.goalsAwayTeam)
        
        homeTeamName.text = currentModel.homeTeam.teamName
        awayTeamName.text = currentModel.awayTeam.teamName
        
        homeTeamFlag.kf.setImage(with: URL(string: currentModel.homeTeam.logo))
        awayTeamFlag.kf.setImage(with: URL(string: currentModel.awayTeam.logo))

        return self
    }

}
