//
//  PokemonListModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

// MARK: - PokemonListModel
struct PokemonListModel: Codable {
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
    
    @discardableResult
    func convertToEntity() -> PokemonListEntity{
        return PokemonListEntity(count: self.count, next: self.next, previous: self.previous, results: self.results)
    }
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
