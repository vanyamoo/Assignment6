//
//  EmojiMemoryGame.swift
//  Sept24Lecture2
//
//  Created by Vanya Mutafchieva on 05/09/2024.
//

import SwiftUI

//@available(iOS 17.0, *)
@Observable class EmojiMemoryGame {
    
    typealias Card = MemoryGame<String>.Card
    
    private var model = createMemoryGame()
    
    private(set) var theme: Theme
    
    init(_ theme: Theme = createRandomTheme()) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    private static func createMemoryGame(theme: Theme = createRandomTheme()) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairs: theme.numOfPairsOfCards) { pairIndex in
            if theme.emoji.indices.contains(pairIndex) {
                return theme.emoji[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private static func createRandomTheme() -> Theme {
        Theme.builtinThemes.randomElement()!
    }
    
    var cards: Array<Card> {
        model.cards
    }
    
// MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func startNewGame(_ theme: Theme = createRandomTheme()) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    var score: Int {
        return model.score
    }
    
    func chooseTheme(theme: Theme) {
        self.theme = theme
    }
}

// MARK: - Extensions
 
extension Theme {
    var mainColor: Color {
        switch color {
        case "blue":
            return .blue
        case "red":
            return .red
        case "green":
            return .green
        case "brown":
            return .brown
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "gray":
            return .gray
        case "pink":
            return .pink
        case "cyan":
            return .cyan
        default:
            return .black
        }
    }
}
