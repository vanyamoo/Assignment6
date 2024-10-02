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
    
    private var model: MemoryGame<String> // = createMemoryGame()
    
    private(set) var theme: Theme
    
    init(_ theme: Theme) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairs: theme.numOfPairsOfCards) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    var cards: Array<Card> {
        model.cards
    }
       
// MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func startNewGame(_ theme: Theme) {
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
    var primaryColor: Color {
        get { Color(rgba: color) }
        set { color = RGBA(color: newValue) }
    }
}

extension Color {
    init(rgba: RGBA) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}
extension RGBA {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}
