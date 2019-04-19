//
//  Card.swift
//  Concentration
//
//  Created by Cez1 on 17/04/2019.
//  Copyright © 2019 Cez1. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

  private  static var identifierFactory = 0

 private   static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
