//
//  PokemonListEntity.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

// MARK: - PokemonListModel
struct PokemonListEntity: Codable {
    let count: Int
    let next: String
    let previous: Bool?
    let results: [Pokemon]

    init(count: Int, next: String, previous: Bool?, results: [Pokemon]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
