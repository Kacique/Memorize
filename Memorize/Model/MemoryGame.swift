//
//  MemoryGame.swift
//  Memorize
//
//  Created by William on 6/28/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    var cards: Array<Card>
    private var indexOfFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
       // if let chosenIndex = index(of: card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            
            if let potentialMatchIndex = indexOfFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched == true
                    cards[chosenIndex].isMatched == true
                }
                indexOfFaceUpCard = nil
            } else{
                for index in 0..<cards.count{
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }
    
    // The code below is already in swift by default
    /*
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    */
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
