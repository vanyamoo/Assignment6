//
//  ThemesStore.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

class ThemesStore: ObservableObject {
    var themes: [Theme] {
        get {
            if let themes = loadThemeData() {
                return themes
            } else {
                return Theme.builtinThemes
            }
        }
        set {
            
            if !newValue.isEmpty {
                save(newValue, to: themesURL)
                objectWillChange.send()
            }
        }
    }
    
    private let themesURL = URL.documentsDirectory.appendingPathComponent("Themes.emojigame")
    
    private func loadThemeData() -> [Theme]? {
        if let jsonData = try? Data(contentsOf: themesURL),
           let decodedData = try? JSONDecoder().decode([Theme].self, from: jsonData) {
            return decodedData
        } else {
            return nil
        }
    }

    
    private func save(_ data: [Theme], to url: URL) {
        do {
            let jsonData = try JSONEncoder().encode(data)
            try jsonData.write(to: themesURL)
        } catch let error {
            print("ThemesStore: error while saving \(error.localizedDescription)")
        }
    }
    
    func append(name: String, emojis: [String] = [], numOfPairsOfCards: Int = 0, color: RGBA = RGBA(color: Color.clear)) {
        let currentHighestId = themes.reduce(0) { partialResult, theme in
            max(partialResult, theme.id)
        }
        let newTheme = Theme(name: "New Theme", emojis: [], numOfPairsOfCards: 0, color: RGBA(color: .black), id: currentHighestId + 1)
        //Theme(name: "Test", emojis: ["🎼","🎤","🎹","🪘","🥁","🎺","🪗","🪕","🎻"], numOfPairsOfCards: 8, color: RGBA(color: .pink), id: currentHighestId + 1)
        
        themes.append(newTheme)
    }
    
    func theme(for themeID: Theme.ID) -> Theme? {
        if let index = themes.firstIndex(where: { $0.id == themeID}) {
            return themes[index]
        }
        else {
            return nil
        }
    }
    
}


