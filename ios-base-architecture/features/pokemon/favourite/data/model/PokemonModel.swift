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
}

struct Sprites: Codable {
    let front_default: String
}

extension PokemonModel: Hashable {
    
    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.height == rhs.height &&
            lhs.weight == rhs.weight &&
            lhs.base_experience == rhs.base_experience
    }
    
    var hashValue: Int {
        return (id << 48) &+ (height << 32) &+ (weight << 16) &+ base_experience
    }
}
