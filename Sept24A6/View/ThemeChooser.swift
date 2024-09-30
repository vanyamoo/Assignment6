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
    
    @State var showThemeEditor = false
    //@State var chosenTheme: Theme?
    @State var chosenThemeId: Theme.ID = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
                    ScrollView {
                        NavigationLink(value: theme.id) {
                            ThemeRow(theme: theme)
                            .foregroundStyle(theme.primaryColor)
                            .swipeActions(edge: .leading) {
                                Button("Edit", systemImage: "pencil") {
                                    chosenThemeId = theme.id
                                    showThemeEditor = true
                                }
                                .tint(.blue)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    withAnimation {
                        store.themes.remove(atOffsets: indexSet)
                    }
                }
                
                
            }
            .navigationDestination(for: Theme.ID.self) { themeId in
//                if let index = store.themes.firstIndex(where: { $0.id == themeId }) {
//                    EmojiMemoryGameView(game: EmojiMemoryGame(store.themes[index]))
//                }
                if let theme = store.theme(for: themeId) {
                    EmojiMemoryGameView(game: EmojiMemoryGame(theme))
                }
                
            }
            .sheet(isPresented: $showThemeEditor) {
                if let themeToEdit = store.theme(for: chosenThemeId) {
                    Text("Test")
                    ThemeEditor(theme: themeToEdit)
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
    
    
    
    struct ThemeRow: View {
        var theme: Theme
        var body: some View {
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
        }
    }
}

#Preview {
    ThemeChooser(store: ThemesStore())
}
