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
    let imageUrl: String
    
    init(name: String, imageUrl: String){
        self.name = name
        self.imageUrl = imageUrl
    }
}


