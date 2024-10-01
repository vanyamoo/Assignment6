//
//  ThemeEditor.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 27/09/2024.
//

import SwiftUI

struct ThemeEditor: View {
    
    @Binding var theme: Theme
    
    @State private var emojisToAdd = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $theme.name)
            } header: {
                Text("Name")
            }

            Section("Emojis") {
                TextField("Add emojis here", text: $emojisToAdd)
                    .onChange(of: emojisToAdd) { oldValue, newValue in
                        if let newEmoji = newValue.last {
                            theme.emojis = [String(newEmoji)] + theme.emojis
                        }
                    }
                Text("Tap to Remove Emojis").font(.caption).foregroundColor(.gray)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 20, maximum: 60))], content: {
                    ForEach(theme.emojis, id: \.self) { emoji in
                        Text(emoji)
                            .onTapGesture {
                                withAnimation {
                                    theme.emojis.removeAll(where: {$0 == emoji})
                                    emojisToAdd.removeAll(where: {String($0) == emoji})
                                }
                            }
                    }
                })
            }
            
            Section("Cards") {
                Stepper("Cards \(theme.numOfPairsOfCards * 2)",
                        onIncrement: {
                    if theme.numOfPairsOfCards < theme.emojis.count {
                        theme.numOfPairsOfCards += 1
                    }
                },
                        onDecrement: {
                    if theme.numOfPairsOfCards > 2 {
                        theme.numOfPairsOfCards -= 1
                    }
                })
            }
            
            Section("Color") {
                ColorPicker("Color", selection: $theme.primaryColor)
            }
        }
    }
}

#Preview {
    @State var theme = ThemesStore().themes.first!
    return ThemeEditor(theme: $theme)
}
