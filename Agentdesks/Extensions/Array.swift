//
//  Array.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/6/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation

extension Sequence where Element == Property {
    
    func sortByCategory(sortCategory: SortCategory) -> [Property] {
        switch sortCategory {
        case .price(let ascending):     return sortByPrice(ascending: ascending)
        case .date(let ascending):      return sortByDate(ascending: ascending)
        case .size(let ascending):      return sortBySize(ascending: ascending)
        default:                        return shuffled()
        }
    }
    
    func sortByPrice(ascending: Bool) -> [Property] {
        return ascending ? sorted { $0.price < $1.price } : sorted { $0.price > $1.price }
    }
    func sortByDate(ascending: Bool) -> [Property] {
        return ascending ? sorted { $0.dateAdded.compare($1.dateAdded) == .orderedAscending } : sorted { $0.dateAdded.compare($1.dateAdded) == .orderedDescending }
    }
    func sortBySize(ascending: Bool) -> [Property] {
        return ascending ? sorted { $0.size < $1.size } : sorted { $0.size > $1.size }
    }
}

extension MutableCollection {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
