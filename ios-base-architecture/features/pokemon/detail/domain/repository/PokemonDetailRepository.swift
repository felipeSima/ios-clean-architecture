//
//  PokemonDetailRepository.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

protocol PokemonDetailRepository {
    func getPokemonDetail(name: String, _ completion: @escaping (PokemonEntity) -> Void, _ failure: @escaping (ServerError) -> Void)
}
