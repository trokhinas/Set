//
//  SetCard.swift
//  Set
//
//  Created by xcode on 09.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct SetCard {
    
    let number : Type
    let color : Type
    let symbol : Type
    let fill: Type
    
    private var identifier: Int
    static var identifierFactory = 0
    
    init(num : Type, col : Type, sym : Type, fill : Type) {
        number = num
        color = col
        symbol = sym
        self.fill = fill
        self.identifier = SetCard.getUniqueIdentifier()
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}

extension SetCard : Hashable {
    
    var hashValue: Int { return identifier }
    
    static func  ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

