//
//  GetPokemonList.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Moya
import Swinject

protocol GetPokemonList {
    func getPokemonList(dataOrigin: DataOrigin, completion: @escaping (PokemonListModel) -> Void, failure: @escaping (ServerError) -> Void)
    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (PokemonModel) -> Void, failure: @escaping (ServerError) -> Void)

}

struct GetPokemonListImpl: GetPokemonList {
    let repository: PokemonListRepository

    init(repository: PokemonListRepository) {
        self.repository = repository
    }

    func getPokemonList(dataOrigin: DataOrigin, completion: @escaping (PokemonListModel) -> Void, failure: @escaping (ServerError) -> Void) {
        repository.getPokemonsList(dataOrigin: dataOrigin, completion: completion, failure: failure)
    }

    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (PokemonModel) -> Void, failure: @escaping (ServerError) -> Void) {
        repository.getPokemon(dataOrigin: dataOrigin, name: name, completion: completion, failure: failure)
    }

}
