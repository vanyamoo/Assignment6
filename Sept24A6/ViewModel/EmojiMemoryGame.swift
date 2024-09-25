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
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
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
    
//    var themeColor: Color {
//        Color(rgba: theme.color)
//    }
//    
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
    var primaryColor: Color {
        Color(rgba: color)
    }
}
 
//extension Theme {
//    var mainColor: Color {
//        switch color {
//        case "blue":
//            return .blue
//        case "red":
//            return .red
//        case "green":
//            return .green
//        case "brown":
//            return .brown
//        case "yellow":
//            return .yellow
//        case "orange":
//            return .orange
//        case "purple":
//            return .purple
//        case "gray":
//            return .gray
//        case "pink":
//            return .pink
//        case "cyan":
//            return .cyan
//        default:
//            return .black
//        }
//    }
//}

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
