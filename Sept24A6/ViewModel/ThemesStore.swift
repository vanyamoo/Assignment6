//
//  ThemesStore.swift
//  Sept24A6
//
//  Created by Vanya Mutafchieva on 25/09/2024.
//

import SwiftUI

@Observable class ThemesStore {
    var themes: [Theme]
    
    init() {
        themes = Theme.builtinThemes
    }
    
}


