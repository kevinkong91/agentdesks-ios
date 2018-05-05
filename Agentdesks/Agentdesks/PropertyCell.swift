//
//  PropertyCell.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/5/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation
import UIKit

class PropertyCell: UICollectionViewCell {
    let property: Property
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var bedBathLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    init(property: Property) {
        super.init(frame: frame)
        self.property = property
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String(describing: self), bundle: Bundle.main)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
