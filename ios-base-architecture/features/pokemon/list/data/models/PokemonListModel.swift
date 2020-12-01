//
//  PokemonListModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation
import RealmSwift

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

    func convertToObject() -> PokemonListObject{
        let pokemonObjects = self.results.map {
            return PokemonObject(name: $0.name, url: $0.url)
        }

        let pokemonObjectList = List<PokemonObject>()

        pokemonObjectList.append(objectsIn: pokemonObjects)

        return PokemonListObject(count: self.count, next: self.next, previous: self.previous ?? false, results: pokemonObjectList)
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

    func convertToObject() -> PokemonObject{
        return PokemonObject(name: self.name, url: self.url)
    }
}
