//
//  Theme.swift
//  Sept24A2
//
//  Created by Vanya Mutafchieva on 10/09/2024.
//

import Foundation

struct Theme: Identifiable, Hashable {
    
    var name: String
    var emojis: Array<String>
    var numOfPairsOfCards: Int
    var color: RGBA
    
    var id = UUID()
    
    static var builtinThemes: [Theme] { [
        Theme(name: "Vehicles", emojis: ["🚙","🚕","🚚","🚑","🚒","🚀","✈️","🚁","🛸","🚲","🛶","🛳","🚂","🛺","🚜"], numOfPairsOfCards: 8, color: RGBA(color: .brown)),
            Theme(name: "Sports", emojis: ["🏈","⚾️","🏀","⚽️","🎾","🏐","🥏","🏓","⛳️","🥅","🥌","🏂","⛷","🎳"], numOfPairsOfCards: 12, color: RGBA(color: .red)),
        Theme(name: "Music", emojis: ["🎼","🎤","🎹","🪘","🥁","🎺","🪗","🪕","🎻"], numOfPairsOfCards: 8, color: RGBA(color: .pink)),
        Theme(name: "Animals", emojis: ["🐥","🐣","🐂","🐄","🐎","🐖","🐓","🐁","🦆","🐢","🐍","🦎","🦕","🐆","🦓","🦧","🦣","🐘","🦏","🦒","🐃","🦮","🐈","🦤","🦢","🦩","🕊","🦨","🐿","🦔"], numOfPairsOfCards: 8, color: RGBA(color: .cyan)),
        Theme(name: "Animal Faces", emojis: ["🐵","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐷","🐸","🐲"], numOfPairsOfCards: 10, color: RGBA(color: .gray)),
        Theme(name: "Flora", emojis: ["🌲","🌴","🌿","☘️","🍁","🍄","🌾","💐","🌷","🌹","🌸","🌻"], numOfPairsOfCards: 9, color: RGBA(color: .green)),
        Theme(name: "Weather", emojis: ["☀️","☁️","🌦","🌧","❄️","💨","💦","☂️","🌪"], numOfPairsOfCards: 8, color: RGBA(color: .blue)),
        Theme(name: "COVID", emojis: ["💉","🦠","😷","🤧","🤒"], numOfPairsOfCards: 8, color: RGBA(color: .purple)),
        Theme(name: "Faces", emojis: ["😀","😂","😇","😍","🥰","🤪","😎","🥸","🤩","🥳","😢","😭","😤","😠","😡","🤯","😳","🥶","😥","😴","🤮","😷","🤧","🤒","🤠"], numOfPairsOfCards: 14, color: RGBA(color: .yellow))
    ] }
}

struct RGBA: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

