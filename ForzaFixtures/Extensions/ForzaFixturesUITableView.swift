//
//  ForzaFixturesUITableView.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/17/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit

extension UITableView {
        
    func dequeueReusableCell<T>(withType type: T.Type, for indexPath: IndexPath) -> T where T: Reusable {
        // swiftlint:disable force_cast
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
