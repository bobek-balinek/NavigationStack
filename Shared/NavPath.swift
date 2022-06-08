//
//  NavPath.swift
//  NavStacks
//
//  Created by Przemyslaw Bobak on 08/06/2022.
//

import SwiftUI

struct NavPath: Equatable {
    static func == (lhs: NavPath, rhs: NavPath) -> Bool {
        return lhs.elements == rhs.elements
    }

    // The stack
    var elements: [AnyHashable] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func append<V>(_ value: V) where V : Hashable {
        elements.append(value)
    }
    
    mutating func removeLast(_ k: Int = 1) {
        elements.removeLast(k)
    }
}
