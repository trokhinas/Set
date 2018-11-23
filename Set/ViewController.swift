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

    @IBAction func deal3CardsButton(_ sender: UIButton) {
    }
    @IBAction func NewGameButton(_ sender: UIButton) {
    }
    @IBAction func HintButton(_ sender: UIButton) {
    }
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var Cards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
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
        for i in model.displayedCards.indices {
            draw(card: i)
        }
    }
    private func draw(card at: Int) {
        let card = Cards[at]
        let setCard = model.displayedCards[at]
        let words = "\(setCard.color)\n\(setCard.fill)\n\(setCard.number)\n\(setCard.symbol)\n"
        
        card.setTitle(words, for: UIControlState.normal)
    }


}

