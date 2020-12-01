//
//  PokemonListEntity.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

// MARK: - PokemonListModel
struct PokemonListEntity: Codable {

    let name: String
    let pokemonId: Int
    let imageUrl: String

    init(name: String, pokemonId: Int, imageUrl: String){
        self.name = name
        self.pokemonId = pokemonId
        self.imageUrl = imageUrl
    }
}

