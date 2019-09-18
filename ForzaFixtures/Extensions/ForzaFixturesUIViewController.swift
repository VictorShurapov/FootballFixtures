//
//  ForzaFixturesUIViewController.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/13/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(errorTitle: String = "Something went wrong.", errorMessage: String) {
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
}
