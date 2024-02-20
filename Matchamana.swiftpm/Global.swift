//
//  Global.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import Foundation

class Matchamana: ObservableObject {
    static var shared = Matchamana()
    var powder: MatchaPowder = .ceremonial
    @Published var step2Done: Bool = false
    @Published var step3Done: Bool = false
    @Published var step4Done: Bool = false
}

enum MatchaPowder: String {
    case ceremonial = "Ceremonial"
    case culinary = "Culinary"
    case premium = "Premium"
}
