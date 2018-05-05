//
//  PropertyCollectionView.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/5/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation
import UIKit

class PropertyCollectionView: UICollectionView {
    
    let properties: [Property]
    
    init(frame: CGRect, properties: [Property]) {
        self.properties = properties
        register(PropertyCell.nib, forCellWithReuseIdentifier: PropertyCell.reuseIdentifier)
        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension PropertyCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        let property = properties[row]
        let cell = PropertyCell(property: property)
        return cell
    }
}
