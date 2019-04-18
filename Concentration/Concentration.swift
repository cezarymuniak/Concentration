//
//  Concentration.swift
//  Concentration
//
//  Created by Cez1 on 17/04/2019.
//  Copyright © 2019 Cez1. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards are matched
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }

                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil

            } else {
                // either 0 cards or 2 cards are face up

                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }

                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
