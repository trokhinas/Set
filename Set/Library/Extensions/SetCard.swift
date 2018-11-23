//
//  SetCard.swift
//  Set
//
//  Created by xcode on 23.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

extension SetCard : Hashable {
    
    var hashValue: Int { return identifier }
    
    static func  ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
