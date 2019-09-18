//
//  Reusable.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/17/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit

protocol Reusable {
    
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
