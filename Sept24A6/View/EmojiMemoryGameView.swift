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
                Text("Score: \(game.score)")
                Spacer()
                Text(game.theme.name)
                    .foregroundStyle(game.theme.primaryColor)
                Spacer()
                Button("New Game") {
                    game.startNewGame()
                }
            }
            
            
            Spacer()
            
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
            Spacer()
        }
        .padding(.horizontal)
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
      EmojiMemoryGameView(game: EmojiMemoryGame())
}
