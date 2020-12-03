//
//  PokemonEntity.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 12/2/20.
//

import Foundation

struct PokemonEntity: Codable {
    let name: String
    let pokemonId: Int
    let imageUrl: String

    init(name: String, pokemonId: Int, imageUrl: String){
        self.name = name
        self.pokemonId = pokemonId
        self.imageUrl = imageUrl
    }
}
