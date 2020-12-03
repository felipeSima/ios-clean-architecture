//
//  PokemonModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let base_experience: Int
    let sprites: Sprites

    @discardableResult
    func convertToEntity() -> PokemonEntity {
        return PokemonEntity(name: self.name, pokemonId: self.id, imageUrl: self.sprites.front_default)
    }
}

struct Sprites: Codable {
    let front_default: String
}
