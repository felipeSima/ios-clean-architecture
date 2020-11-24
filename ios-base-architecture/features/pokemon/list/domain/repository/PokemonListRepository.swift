//
//  PokemonListRepository.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

protocol PokemonListRepository {
    func getPokemonsList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ())
}
