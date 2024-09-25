//
//  ThemeChooser.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

struct ThemeChooser: View {
    var themesStore: ThemesStore
    var body: some View {
        
            List {
                ForEach(themesStore.themes) { theme in
                    ScrollView {
                    VStack {
                        HStack {
                            Text(theme.name)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
//                            Circle()
//                                .frame(maxWidth: 20)
//                                .foregroundStyle(theme.primaryColor)
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
                    //.backgroundStyle(theme.primaryColor)
                    .foregroundStyle(theme.primaryColor)
                }
            }
        }
    }
}

#Preview {
    ThemeChooser(themesStore: ThemesStore())
}
