//
//  ViewController.swift
//  Concentration
//
//  Created by Cez1 on 16/04/2019.
//  Copyright © 2019 Cez1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private  lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards : Int {
        get{
          return  (cardButtons.count + 1) / 2
        }
        
    }
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    @IBOutlet var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in the card button")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.6181919844, blue: 0.1973338485, alpha: 0) : #colorLiteral(red: 1, green: 0.6181919844, blue: 0.1973338485, alpha: 1)
            }
        }
    }
    
   private var emojiChoices = ["👻", "🎃", "🦷", "🍾", "🍩", "🥃", "🍖", "🍟"]
    
    private var emoji = [Int: String]()
    
   private func emoji(for card: Card) -> String {
    
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let x = 5.arc4random
            let randomIndex =
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            
        
            return Int(arc4random_uniform(UInt32(self)))}
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        } else  {
            return 0
        }
    }
}
