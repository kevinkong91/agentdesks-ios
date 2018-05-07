//
//  SortCategory.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/6/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation

enum SortOption {
    case price
    case date
    case size
    case random
    
    func sortCategory(previousSortCategory: SortCategory?) -> SortCategory {
        let ascending = previousSortCategory?.reverseSortOrder() ?? true
        switch self {
        case .price:        return .price(ascending: ascending)
        case .date:         return .date(ascending: ascending)
        case .size:         return .size(ascending: ascending)
        case .random:       return .random
        }
    }
}

enum SortCategory {
    case price(ascending: Bool)
    case date(ascending: Bool)
    case size(ascending: Bool)
    case random
    
    func reverseSortOrder() -> Bool {
        switch self {
        case .date(let ascending):
            return !ascending
        case .price(let ascending):
            return !ascending
        case .size(let ascending):
            return !ascending
        default:
            return false
        }
    }
}
