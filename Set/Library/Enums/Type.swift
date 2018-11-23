//
//  Type.swift
//  Set
//
//  Created by xcode on 23.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

enum Type : Int{
    
    case v1 = 1, v2, v3
    
    static func getAll() -> [Type] {
        return [.v1, .v2, .v3]
    }
    func index(type : Type) -> Int {
        return type.rawValue
    }
}
