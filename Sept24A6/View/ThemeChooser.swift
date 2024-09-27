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
    
    @ObservedObject var store: ThemesStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
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
            .navigationDestination(for: Theme.ID.self) { themeId in
                if let index = store.themes.firstIndex(where: { $0.id == themeId }) {
                    EmojiMemoryGameView(game: EmojiMemoryGame(store.themes[index]))
                }
            }
            .navigationTitle("Themes")
            .toolbar {
                Button {
                    store.append(name: "")
                    //showCursorPalette = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

//#Preview {
//    ThemeChooser(themesStore: ThemesStore())
//}
