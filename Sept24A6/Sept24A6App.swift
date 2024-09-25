//
//  Sept24A6App.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

@main
struct Sept24A6App: App {
    @State private var game = EmojiMemoryGame()
        var body: some Scene {
            WindowGroup {
                EmojiMemoryGameView(game: game)
            }
        }
}
