//
//  Theme.swift
//  Sept24A2
//
//  Created by Vanya Mutafchieva on 10/09/2024.
//

import Foundation

struct Theme: Identifiable, Hashable, Codable {
    
    var name: String
    var emojis: Array<String>
    var numOfPairsOfCards: Int
    var color: RGBA
    
    let id: Int
      
    static var builtinThemes: [Theme] { [
        Theme(name: "Vehicles", emojis: ["🚙","🚕","🚚","🚑","🚒","🚀","✈️","🚁","🛸","🚲","🛶","🛳","🚂","🛺","🚜"], numOfPairsOfCards: 8, color: RGBA(color: .brown), id: 0),
        Theme(name: "Sports", emojis: ["🏈","⚾️","🏀","⚽️","🎾","🏐","🥏","🏓","⛳️","🥅","🥌","🏂","⛷","🎳"], numOfPairsOfCards: 12, color: RGBA(color: .red), id: 1),
        Theme(name: "Music", emojis: ["🎼","🎤","🎹","🪘","🥁","🎺","🪗","🪕","🎻"], numOfPairsOfCards: 8, color: RGBA(color: .pink), id: 2),
        Theme(name: "Animals", emojis: ["🐥","🐣","🐂","🐄","🐎","🐖","🐓","🐁","🦆","🐢","🐍","🦎","🦕","🐆","🦓","🦧","🦣","🐘","🦏","🦒","🐃","🦮","🐈","🦤","🦢","🦩","🕊","🦨","🐿","🦔"], numOfPairsOfCards: 8, color: RGBA(color: .cyan), id: 3),
        Theme(name: "Animal Faces", emojis: ["🐵","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐷","🐸","🐲"], numOfPairsOfCards: 10, color: RGBA(color: .gray), id: 4),
        Theme(name: "Flora", emojis: ["🌲","🌴","🌿","☘️","🍁","🍄","🌾","💐","🌷","🌹","🌸","🌻"], numOfPairsOfCards: 9, color: RGBA(color: .green), id: 5),
        Theme(name: "Weather", emojis: ["☀️","☁️","🌦","🌧","❄️","💨","💦","☂️","🌪"], numOfPairsOfCards: 8, color: RGBA(color: .blue), id: 6),
        Theme(name: "COVID", emojis: ["💉","🦠","😷","🤧","🤒"], numOfPairsOfCards: 8, color: RGBA(color: .purple), id: 7),
        Theme(name: "Faces", emojis: ["😀","😂","😇","😍","🥰","🤪","😎","🥸","🤩","🥳","😢","😭","😤","😠","😡","🤯","😳","🥶","😥","😴","🤮","😷","🤧","🤒","🤠"], numOfPairsOfCards: 14, color: RGBA(color: .yellow), id: 8)
    ] }
}

struct RGBA: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

