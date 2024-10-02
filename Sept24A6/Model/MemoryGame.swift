//
//  MemoryGame.swift
//  Sept24Lecture2
//
//  Created by Vanya Mutafchieva on 05/09/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private mutating func calculateScore(_ match: Bool, indicesOfCardsInRound: Array<Int>) {
            if match { score += 2 }
            else {
                indicesOfCardsInRound.forEach { index in score -= cards[index].isSeen ? 1 : 0 }
            }
        }
        
        private var indexOfTheOneAndOnlyFaceUpCard: Int? {
            get { cards.indices.filter { index in cards[index].isFaceUp }.only }
            set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)} }
        }
    
    mutating func choose(_ card: Card) {
            var match = false
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        match = true
                    }
                    cards[chosenIndex].isFaceUp = true
                    calculateScore(match, indicesOfCardsInRound: [potentialMatchIndex, chosenIndex])
                    cards[potentialMatchIndex].isSeen = true
                    cards[chosenIndex].isSeen = true
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            }
        }
    
    init(numberOfPairs: Int, cardFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        // add 2x numberOfPairs cards to cards array
        for cardIndex in 0..<max(2, numberOfPairs) {
            let cardContent = cardFactory(cardIndex)
            cards.append(Card(content: cardContent, id: "\(cardIndex+1)a"))
            cards.append(Card(content: cardContent, id: "\(cardIndex+1)b"))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isSeen = false
        let content: CardContent
        let id: String
    }
}

extension Array {
    var only: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
