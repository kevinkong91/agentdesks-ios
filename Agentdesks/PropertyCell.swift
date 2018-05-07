//
//  PropertyCell.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/5/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation
import UIKit

class PropertyCell: UITableViewCell {
    
    var property: Property!
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bedBathLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource>(dataSourceDelegate: D, forRow row: Int) {
        photosCollectionView.dataSource = dataSourceDelegate
        photosCollectionView.tag = row
        photosCollectionView.reloadData()
    }
}
