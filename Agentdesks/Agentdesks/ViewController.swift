//
//  ViewController.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/5/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sortButton: UIBarButtonItem!
    @IBOutlet var propertyCollectionView: PropertyCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPropertyCollectionView()
    }

    func setupPropertyCollectionView() {
        let frame = CGRect.zero
        let properties = []
        propertyCollectionView = PropertyCollectionView(frame: frame, properties: properties)
        
    }
}
