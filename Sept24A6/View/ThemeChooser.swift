//
//  ThemeChooser.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

struct ThemeChooser: View {
    
    @State private var showGame = false
    
    @ObservedObject var store: ThemesStore
    
    @State var showThemeEditor = false

    var body: some View {
        NavigationStack {
            themeList
            .navigationDestination(for: Theme.ID.self) { themeId in
                if let theme = store.theme(for: themeId) {
                    EmojiMemoryGameView(game: EmojiMemoryGame(theme))
                }
            }
            .sheet(isPresented: $showThemeEditor) {
                ThemeEditor(theme: $store.themes[store.cursorIndex])
            }
            .navigationTitle("Themes")
            .toolbar {
                new
            }
        }
    }
    
    @ViewBuilder
    private var themeList: some View {
        List {
            ForEach(store.themes) { theme in
                ScrollView {
                    NavigationLink(value: theme.id) {
                        ThemeRow(theme: theme)
                            .swipeActions(edge: .leading) {
                                editButton(theme.id)
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
    }
    
    struct ThemeRow: View {
        var theme: Theme
        var body: some View {
            VStack {
                HStack {
                    themeName
                    Spacer()
                    numOfCards
                }
                Spacer()
                emojis
            }
            .foregroundStyle(theme.primaryColor)
        }
        
        @ViewBuilder
        private var themeName: some View {
            Text(theme.name)
                .fontWeight(.bold)
                .font(.system(size: 20))
        }
        
        @ViewBuilder
        private var numOfCards: some View {
            Text("\(theme.numOfPairsOfCards * 2) cards")
        }
        
        @ViewBuilder
        private var emojis: some View {
            HStack {
                ForEach(theme.emojis[0..<min(10, theme.emojis.count)], id: \.self) { emoji in
                    Text(emoji)
                        .aspectRatio(contentMode: .fill)
                        .truncationMode(.tail)
                }
            }
        }
    }
    
    @ViewBuilder
    private func editButton(_ themeId:Theme.ID) -> some View {
        Button("Edit", systemImage: "pencil") {
            editTheme(themeId)
        }
        .tint(.blue)
    }
    
    private func editTheme(_ themeId:Theme.ID) {
        if let index = store.themeIndex(for: themeId) {
            store.cursorIndex = index
        }
        showThemeEditor = true
    }
    
    @ViewBuilder
    private var new: some View {
        Button {
            let newTheme = store.append(name: "")
            editTheme(newTheme.id)
        } label: {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    ThemeChooser(store: ThemesStore())
}
