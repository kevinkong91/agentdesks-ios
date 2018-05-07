//
//  ViewModel.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/6/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation

struct ViewModel {
    let properties: [Property]
    
    init() {
        var properties: [Property] = []
        for _ in 0..<20 {
            var photos: [String] = []
            let randomPhotoCount = Int.random(min: 1, max: 6)
            for _ in 0..<randomPhotoCount {
                photos.append("https://picsum.photos/80")
            }
            let price = Double.random(min: 100000.0, max: 4000000.0)
            let beds = Int.random(min: 1, max: 6)
            let baths = Float(Int.random(min: beds/2, max: beds))
            let size = Int.random(min: 1000, max: 30000)
            let date = Date.randomDate(daysBack: 100)
            let property = Property(photos: photos, price: price, beds: beds, baths: baths, size: size, dateAdded: date)
            properties.append(property)
        }
        self.properties = properties
    }
}
