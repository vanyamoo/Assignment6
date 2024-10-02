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
// MARK: - Persistentce
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
    
// MARK: - Adding themes
    func append(name: String, emojis: [String] = [], numOfPairsOfCards: Int = 0, color: RGBA = RGBA(color: Color.clear)) -> Theme {
        let currentHighestId = themes.reduce(0) { partialResult, theme in
            max(partialResult, theme.id)
        }
        let newTheme = Theme(name: "New Theme", emojis: [], numOfPairsOfCards: 0, color: RGBA(color: .black), id: currentHighestId + 1)
        themes.append(newTheme)
        return newTheme
    }
    
// MARK: - Helpers for the View
    func theme(for themeID: Theme.ID) -> Theme? {
        if let index = themeIndex(for: themeID) {
            return themes[index]
        } else {
            return nil
        }
    }
    
    func themeIndex(for themeID: Theme.ID) -> Int? {
        if let index = themes.firstIndex(where: { $0.id == themeID}) {
            return index
        }
        else {
            return nil
        }
    }
    
    private var _cursorIndex = 0
    
    var cursorIndex: Int {
        get { _cursorIndex }
        set { _cursorIndex = newValue }
    }
    
}

extension Array where Element == String {
    var uniqued: [Element] {
        reduce(into: []) { partialResult, element in
            if !partialResult.contains(element) {
                partialResult.append(element)
            }
        }
    }
}

extension String {
    var isEmoji: Bool {
        if let firstScalar = Character(self).unicodeScalars.first, firstScalar.properties.isEmoji {
            return (firstScalar.value >= 0x238d || unicodeScalars.count > 1)
        } else {
            return false
        }
    }
}


