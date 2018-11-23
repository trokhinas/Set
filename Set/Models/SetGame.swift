//
//  SetGame.swift
//  Set
//
//  Created by xcode on 09.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation


class SetGame  {
    var deckOfCards = [SetCard]()
    var displayedCards = [SetCard]()
    var matchedCards = [SetCard]()
    
    init() {
        initCards()
        for _ in 0...11 {
            let cardFromDeck = deckOfCards.remove(at: 0)
            displayedCards.append(cardFromDeck)
        }
    }
    
    func initCards() {
        for number in Type.getAll(){
            for color in Type.getAll(){
                for symbol in Type.getAll(){
                    for fill in Type.getAll(){
                        let card = SetCard(num: number, col: color, sym: symbol, fill: fill)
                        deckOfCards += [card]
                    }
                }
            }
        }
        deckOfCards.shuffle()
    }
    
    public func chooseCard(at: Int) {
        
    }
    
    private func isSet() -> Bool{
        if(matchedCards.count != 3) {
            return false
        }
        
        let card1 = matchedCards[0]
        let card2 = matchedCards[1]
        let card3 = matchedCards[2]
        
        //ОТВРАТИТЕЛЬНО!
        if (card1.color == card2.color && card2.color == card3.color) || (card1.color != card2.color && card2.color != card3.color && card1.color != card3.color) {
            if (card1.number == card2.number && card2.number == card3.number) || (card1.number != card2.number && card2.number != card3.number && card1.number != card3.number) {
                if (card1.fill == card2.fill && card2.fill == card3.fill) || (card1.fill != card2.fill && card2.fill != card3.fill && card1.fill != card3.fill) {
                    if (card1.symbol == card2.symbol && card2.symbol == card3.symbol) || (card1.symbol != card2.symbol && card2.symbol != card3.symbol && card1.symbol != card3.symbol) {
                        return true
                    }
                }
            }
        }
        return false
        
    }
    
}
