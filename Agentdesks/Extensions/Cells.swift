//
//  Cells.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/6/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static var nib: UINib {
        return UINib.init(nibName: String(describing: self), bundle: Bundle.main)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
