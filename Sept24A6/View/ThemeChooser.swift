//
//  ThemeChooser.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

struct ThemeChooser: View {
    //@State private var game = EmojiMemoryGame()
    @State private var showGame = false
    
    var themesStore: ThemesStore
    var body: some View {
        NavigationStack {
            List {
                ForEach(themesStore.themes) { theme in
                    ScrollView {
                        NavigationLink(value: theme.id) {
                            VStack {
                                HStack {
                                    Text(theme.name)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    //Circle()
                                    //  .frame(maxWidth: 20)
                                    //  .foregroundStyle(theme.primaryColor)
                                    Spacer()
                                    Text("\(theme.numOfPairsOfCards * 2) cards")
                                }
                                Spacer()
                                HStack {
                                    ForEach(theme.emojis[0..<min(10, theme.emojis.count)], id: \.self) { emoji in
                                        Text(emoji)
                                            .aspectRatio(contentMode: .fill)
                                            .truncationMode(.tail)
                                    }
                                }
                            }
                            .foregroundStyle(theme.primaryColor)
                        }
                    }
                }
            }
//            .navigationDestination(isPresented: $showGame) {
//                EmojiMemoryGameView(game: game)
//            }
            
            .navigationDestination(for: Theme.ID.self) { themeId in
                if let index = themesStore.themes.firstIndex(where: { $0.id == themeId }) {
                    EmojiMemoryGameView(game: EmojiMemoryGame(themesStore.themes[index]))

                }
            }
            .navigationTitle("Themes")
        }
        
    }
}

#Preview {
    ThemeChooser(themesStore: ThemesStore())
}
