//
//  Theme.swift
//  Sept24A2
//
//  Created by Vanya Mutafchieva on 10/09/2024.
//

import Foundation

struct Theme {
    
    var name: String
    var emoji: Array<String>
    var numOfPairsOfCards: Int
    var color: String
    
    static var builtinThemes: [Theme] { [
        Theme(name: "Vehicles", emoji: ["🚙","🚕","🚚","🚑","🚒","🚀","✈️","🚁","🛸","🚲","🛶","🛳","🚂","🛺","🚜"], numOfPairsOfCards: 8, color: "brown"),
            Theme(name: "Sports", emoji: ["🏈","⚾️","🏀","⚽️","🎾","🏐","🥏","🏓","⛳️","🥅","🥌","🏂","⛷","🎳"], numOfPairsOfCards: 12, color: "red"),
        Theme(name: "Music", emoji: ["🎼","🎤","🎹","🪘","🥁","🎺","🪗","🪕","🎻"], numOfPairsOfCards: 8, color: "pink"),
        Theme(name: "Animals", emoji: ["🐥","🐣","🐂","🐄","🐎","🐖","🐓","🐁","🦆","🐢","🐍","🦎","🦕","🐆","🦓","🦧","🦣","🐘","🦏","🦒","🐃","🦮","🐈","🦤","🦢","🦩","🕊","🦨","🐿","🦔"], numOfPairsOfCards: 8, color: "cyan"),
        Theme(name: "Animal Faces", emoji: ["🐵","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐷","🐸","🐲"], numOfPairsOfCards: 10, color: "gray"),
        Theme(name: "Flora", emoji: ["🌲","🌴","🌿","☘️","🍁","🍄","🌾","💐","🌷","🌹","🌸","🌻"], numOfPairsOfCards: 9, color: "green"),
        Theme(name: "Weather", emoji: ["☀️","☁️","🌦","🌧","❄️","💨","💦","☂️","🌪"], numOfPairsOfCards: 8, color: "blue"),
        Theme(name: "COVID", emoji: ["💉","🦠","😷","🤧","🤒"], numOfPairsOfCards: 8, color: "purple"),
        Theme(name: "Faces", emoji: ["😀","😂","😇","😍","🥰","🤪","😎","🥸","🤩","🥳","😢","😭","😤","😠","😡","🤯","😳","🥶","😥","😴","🤮","😷","🤧","🤒","🤠"], numOfPairsOfCards: 14, color: "yellow")
    ] }
}
