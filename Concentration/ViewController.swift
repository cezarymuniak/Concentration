//
//  ViewController.swift
//  Concentration
//
//  Created by Cez1 on 16/04/2019.
//  Copyright © 2019 Cez1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet{
             flipCountLabel.text = "Flips = \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
       
    } else {
    print ("chosen card was not in the card button")
    }
    }
        
  
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
            if button.currentTitle == emoji {
                button.setTitle("", for: UIControl.State.normal)
                
                button.backgroundColor = #colorLiteral(red: 1, green: 0.6181919844, blue: 0.1973338485, alpha: 1)
            } else {
                
                button.setTitle(emoji, for: UIControl.State.normal)
                
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                
                
                
            }
    }
}

