//
//  Ranking.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import Foundation

/// Custom type representing Ranking CK structure
struct Ranking: Identifiable {
    let id: UUID = UUID()
    let name: String
    let country: String
    let pts: Int
    let position: Int

    init(name: String, country: String, pts: Int, position: Int) {
        self.name = name
        self.country = country
        self.pts = pts
        self.position = position
    }

    init() {
        name = String()
        country = String()
        pts = Int()
        position = Int()
    }
}
