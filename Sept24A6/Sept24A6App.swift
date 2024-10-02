//
//  Sept24A6App.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

@main
struct Sept24A6App: App {
    @StateObject private var themesStore = ThemesStore()
        var body: some Scene {
            WindowGroup {
                ThemeChooser(store: themesStore)
            }
        }
}
