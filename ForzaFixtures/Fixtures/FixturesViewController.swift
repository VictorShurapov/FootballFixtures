//
//  FixturesViewController.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/12/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit
import MaterialComponents

class FixturesViewController: UIViewController {

    @IBOutlet weak var roundsTabBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewModel
    fileprivate let viewModel = FixturesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.estimatedRowHeight = 82.0
//        tableView.rowHeight = UITableView.automaticDimension
        
        setTabBar()
        getFixtures()
    }
    
    func getFixtures() {
        viewModel.getFixturesForWorldCupWith(completion: { self.setupFixturesForRoundWith() }, errorDescription: { (errorDescription) in
            self.showAlert(errorMessage: errorDescription)
        })
    }
    
    fileprivate func setTabBar() {
        let tabBar = MDCTabBar(frame: roundsTabBar.bounds)
        tabBar.delegate = self
        tabBar.items = [
            UITabBarItem(title: NSLocalizedString("1/8", comment: "TabBar title for available products"), image: nil, tag: 0),
            UITabBarItem(title: NSLocalizedString("1/4", comment: "TabBar title for coming products"), image: nil, tag: 1),
            UITabBarItem(title: NSLocalizedString("1/2", comment: "TabBar title for coming products"), image: nil, tag: 2),
            UITabBarItem(title: NSLocalizedString("X", comment: "TabBar title for coming products"), image: nil, tag: 3)
            
        ]
        tabBar.itemAppearance = .titles
        tabBar.barTintColor = .black
        tabBar.inkColor = .clear
        tabBar.tintColor = .blue
        tabBar.setTitleColor(.white, for: .normal)
        tabBar.setTitleColor(.white, for: .selected)
        tabBar.selectedItemTitleFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
        tabBar.unselectedItemTitleFont = UIFont.systemFont(ofSize: 14)
        tabBar.displaysUppercaseTitles = false
        tabBar.alignment = .justified
        tabBar.sizeToFit()
        roundsTabBar.addSubview(tabBar)
    }
}

extension FixturesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mathesForRound.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withType: MatchTableViewCell.self, for: indexPath).configured(withModel: viewModel.mathesForRound[indexPath.row])    }
}

extension FixturesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

// MARK: MDCTabBarDelegate
extension FixturesViewController: MDCTabBarDelegate {
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        setupFixturesForRoundWith(itemTag: item.tag)
    }
    
    func setupFixturesForRoundWith(itemTag: Int = 0) {
        guard let roundNameStringForFiltering = viewModel.getRoundNameFor(itemTag: itemTag) else { return }
        viewModel.getMatchesFor(round: roundNameStringForFiltering)
        tableView.reloadData()
    }
    
}
