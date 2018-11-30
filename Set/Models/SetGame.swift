//
//  SetGame.swift
//  Set
//
//  Created by xcode on 09.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation


class SetGame  {
    var deckOfCards = SetCardDeck()
    var displayedCards = [SetCard]()
    var selectedCards = [SetCard]()
    var matchedCards = [SetCard]()
    
    init() {
        print("initial cards: /n")
        for _ in 0...11 {
            let cardFromDeck = deckOfCards.draw()
            displayedCards.append(cardFromDeck!)
            print(cardFromDeck!)
        }
    }
    
    
    public func chooseCard(index: Int) {
        if(index < displayedCards.count) {
            print(displayedCards[index])
            selectCard(index: index)
        }
        
    }
    public func deal() {
        removeSetIfExist()
        print("3 more cards: ")
        for _ in 0...2 {
            let cardFromDeck = deckOfCards.draw()
            displayedCards.append(cardFromDeck!)
            print(cardFromDeck!)
        }
    }
    public func hint() {
        for i1 in displayedCards.indices{
            for i2 in displayedCards.indices {
                for i3 in displayedCards.indices {
                    if(i1  != i2 && i2 != i3){
                        if(isSet(card1: displayedCards[i1],card2: displayedCards[i2],card3: displayedCards[i3])){
                            print("There is ser with \(i1), \(i2), \(i3) indices")
                        }
                    }
                }
            }
        }
    }
    
    private func selectCard(index: Int) {
        if(index > displayedCards.count) {return}
        
        let card = displayedCards[index]
        if(selectedCards.contains(card)){return}
        
        if(selectedCards.count == 3) {
            removeSetIfExist()
            removeSelected()
        }
        selectedCards.append(card)
    }
    
    private func removeSetIfExist() {
        if(isSet()) {
            for i in 0...2{
                print("card: \(selectedCards[i])" )
                let index = displayedCards.index(of: selectedCards[i])
                displayedCards.remove(at: index!)
                selectedCards.remove(at: i)
            }
        }
    }
    private func removeSelected() {
        selectedCards.removeAll()
    }
    private func isSet() -> Bool{
        if(selectedCards.count != 3) {
            return false
        }
        
        let card1 = selectedCards[0]
        let card2 = selectedCards[1]
        let card3 = selectedCards[2]
        
        //ОТВРАТИТЕЛЬНО!
        if (isSetParam(param1: card1.fill, param2: card2.fill, param3: card3.fill)) {
            if (isSetParam(param1: card1.color, param2: card2.color, param3: card3.color)) {
                if (isSetParam(param1: card1.number, param2: card2.number, param3: card3.number)) {
                    if (isSetParam(param1: card1.symbol, param2: card2.symbol, param3: card3.symbol)) {
                        return true
                    }
                }
            }
        }
        return false
        
    }
    private func isSet(card1: SetCard, card2: SetCard, card3: SetCard) -> Bool{
        
        //ОТВРАТИТЕЛЬНО!
        if (isSetParam(param1: card1.fill, param2: card2.fill, param3: card3.fill)) {
            if (isSetParam(param1: card1.color, param2: card2.color, param3: card3.color)) {
                if (isSetParam(param1: card1.number, param2: card2.number, param3: card3.number)) {
                    if (isSetParam(param1: card1.symbol, param2: card2.symbol, param3: card3.symbol)) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    private func isSetParam(param1: Type, param2: Type, param3: Type) -> Bool {
        if(param1 == param2 && param2 == param3){return true}
        else if(param1 != param2 && param1 != param3 && param3 != param2){return true}
        return false
    }
    
}
