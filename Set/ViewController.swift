//
//  ViewController.swift
//  Set
//
//  Created by xcode on 09.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var model = SetGame()
    private var cardColor: UIColor = #colorLiteral(red: 0.714486698, green: 0.7708367465, blue: 0.7669996681, alpha: 1)
    private var bgColor: UIColor = #colorLiteral(red: 0.9058823529, green: 0.8650250873, blue: 0.8585260985, alpha: 1)

    @IBAction func deal3CardsButton(_ sender: UIButton) {
        if(model.displayedCards.count < 24){
            model.deal()
            updateViewFromModel()
        }
        
    }
    @IBAction func NewGameButton(_ sender: UIButton) {
        model = SetGame()
        updateViewFromModel()
    }
    @IBAction func HintButton(_ sender: UIButton) {
        model.hint()
        updateViewFromModel()
    }
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var Cards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = Cards.index(of: sender) {
            model.chooseCard(index: cardNumber)
            updateViewFromModel()

        } else {
            print("choosen card is not in cardButton")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    private func updateViewFromModel(){
        for i in Cards.indices {
            if(i < model.displayedCards.count) {
                draw(card: i)
            }
            else {clearCard(index: i)}
        }
    }
    private func draw(card at: Int) {
        let card = Cards[at]
        let setCard = model.displayedCards[at]
        let words = "color:\(setCard.color)\n fill:\(setCard.fill)\n number:\(setCard.number)\n symbol:\(setCard.symbol)\n"
        
        card.setTitle(words, for: UIControlState.normal)
        card.backgroundColor = cardColor
        if(model.selectedCards.contains(setCard)){
            selectCard(index: at)
        }
        else {
            deselectCard(index: at)
        }
    }
    private func selectCard(index: Int) {
        let button = Cards[index]
        
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor.blue.cgColor
    }
    private func deselectCard(index: Int) {
        let button = Cards[index]
        
        button.layer.borderWidth = 0.0
        button.layer.borderColor = UIColor.blue.cgColor
    }
    private func clearCard(index: Int) {
        let card = Cards[index]
        
        card.backgroundColor = UIColor.clear
        card.setTitle("", for: UIControlState.normal)
        deselectCard(index: index)
    }


}

