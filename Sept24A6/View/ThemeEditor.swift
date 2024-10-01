//
//  ThemeEditor.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 27/09/2024.
//

import SwiftUI

struct ThemeEditor: View {
    
    @Binding var theme: Theme
    
    var body: some View {
        //VStack {
            Text(theme.name)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 20, maximum: 60))], content: {
                ForEach(theme.emojis, id: \.self) { emoji in
                    Text(emoji)
                }
            })
            Text("Cards: \(theme.numOfPairsOfCards)")
            Text("Theme ID: \(theme.id)")
        //}
    }
}

//#Preview {
//    @State var theme = ThemesStore().themes.first!
//    return ThemeEditor(theme: $theme)
//}
