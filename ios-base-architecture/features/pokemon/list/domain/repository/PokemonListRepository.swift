//
//  PokemonListRepository.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

protocol PokemonListRepository {
    func getPokemonsList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemon(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
}
