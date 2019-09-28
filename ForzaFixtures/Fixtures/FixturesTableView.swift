//
//  FixturesTableView.swift
//  ForzaFixtures
//
//  Created by ViktorX on 9/27/19.
//  Copyright © 2019 ViktorX. All rights reserved.
//

import UIKit

class FixturesTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
