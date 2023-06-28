//
//  MemoryGame.swift
//  Memorize
//
//  Created by William on 6/28/23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
