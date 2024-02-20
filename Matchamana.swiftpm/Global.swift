//
//  Global.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import Foundation

struct Matchamana {
    static var shared = Matchamana()

    var powder: MatchaPowder = .ceremonial
}

enum MatchaPowder: String {
    case ceremonial = "Ceremonial"
    case culinary = "Culinary"
    case premium = "Premium"
}
