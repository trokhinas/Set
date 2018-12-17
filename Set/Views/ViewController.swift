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

    @IBAction func deal3CardsButton(_ sender: SetButton) {

        updateViewFromModel()
        
    }
    @IBAction func NewGameButton(_ sender: SetButton) {
        model = SetGame()
        updateViewFromModel()
    }
    @IBAction func HintButton(_ sender: SetButton) {
        updateViewFromModel()
    }
    
    
    @IBOutlet weak var dealButton: SetButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var Cards: [SetButton]!
    
    @IBAction func touchCard(_ sender: SetButton) {
        if let cardNumber = Cards.index(of: sender) {
            model.chooseCard(at: cardNumber)
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
            draw(index: i)
        }
        updateDealButton()
        
        
    }
    private func updateDealButton() {
        
    }
    private func draw(index: Int) {
        let button = Cards[index]
        //проверяем отображается ли эта карта
        if(index < model.displayedCards.count) {
            var currentCard = model.displayedCards[index]
            button.card = currentCard
            if(model.selectedCards.contains(currentCard)) {
                selectCard(index: index)
            }
            else {
                deselectCard(index: index)
            }
        }
        else {button.card = nil}
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
   
    

}

