//
//  PokemonListRepository.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

protocol PokemonListRepository {
    func getPokemonsList(dataOrigin: DataOrigin, completion: @escaping (PokemonListModel) -> Void, failure: @escaping (ServerError) -> Void)
    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (PokemonModel) -> Void, failure: @escaping (ServerError) -> Void)
}
