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
    func getPokemonList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemon(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
}

struct GetPokemonListImpl: GetPokemonList {
    let repository: PokemonListRepository
    
    init(repository: PokemonListRepository) {
        self.repository = repository
    }
    
    func getPokemonList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ()) {
        repository.getPokemonsList(completion: completion, failure: failure)
    }
    
    func getPokemon(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()) {
        repository.getPokemon(name: name, completion: completion, failure: failure)
    }
    
}
