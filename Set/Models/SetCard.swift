//
//  SetCard.swift
//  Set
//
//  Created by xcode on 09.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct SetCard {
    
    let number : Number
    let color : Color
    let symbol : Symbol
    let shading : Shading
    
    init(num : Number, col : Color, sym : Symbol, shading : Shading) {
        number = num
        color = col
        symbol = sym
        self.shading = shading
    }
}
