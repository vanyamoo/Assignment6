//
//  EmojiMemoryGameView.swift
//  Sept24Lecture2
//
//  Created by Vanya Mutafchieva on 05/09/2024.
//

import SwiftUI

//@available(iOS 17.0, *)
struct EmojiMemoryGameView: View {
    
    var game: EmojiMemoryGame
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                score
                Spacer()
                themeName
                Spacer()
                newGame
            }
            Spacer()
            cards
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var score: some View {
        Text("Score: \(game.score)")
    }
    
    @ViewBuilder
    private var themeName: some View {
        Text(game.theme.name)
            .foregroundStyle(game.theme.primaryColor)
    }
    
    @ViewBuilder
    private var newGame: some View {
        Button("New Game") {
            game.startNewGame(game.theme)
        }
    }
    
    @ViewBuilder
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65), spacing: 0)], spacing: 0) {
            ForEach(game.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundStyle(game.theme.primaryColor)
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                cardShape
                    .foregroundStyle(.white)
                cardShape
                    .stroke()
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                cardShape.opacity(0)
            } else {
                cardShape
            }
        }
        .padding(2)
    }
}
//@available(iOS 17.0, *)
#Preview {
    EmojiMemoryGameView(game: EmojiMemoryGame(Theme(name: "Music", emojis: ["🎼","🎤","🎹","🪘","🥁","🎺","🪗","🪕","🎻"], numOfPairsOfCards: 8, color: RGBA(color: .pink), id: 2)))
}
