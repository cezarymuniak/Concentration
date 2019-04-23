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
    
    private(set) var flipCount = 0 { didSet  {
    
       updateFlipCountLabel()
        }}
        private func updateFlipCountLabel() {
            
            
            let attributes: [NSAttributedString.Key:Any] = [
                
                .strokeWidth : 5.0,
                .strokeColor : #colorLiteral(red: 1, green: 0.6181919844, blue: 0.1973338485, alpha: 1)
             ]
            
            let attributedString = NSAttributedString(string: "Flips: \(flipCount)" , attributes: attributes)
flipCountLabel.attributedText = attributedString
            
        }
        
     
    
 
    @IBOutlet var flipCountLabel: UILabel! {
        didSet{
            updateFlipCountLabel()
        }
    }
    
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
    
//   private var emojiChoices = ["👻", "🎃", "🦷", "🍾", "🍩", "🥃", "🍖", "🍟"]
    private var emojiChoices = "👻🎃🦷🍾🍩🥃🍖🍟"
    private var emoji = [Card: String]()
    
   private func emoji(for card: Card) -> String {
    
        if emoji[card] == nil, emojiChoices.count > 0 {
           
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
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
