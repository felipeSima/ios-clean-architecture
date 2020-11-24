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
    func getPokemonList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ())
}

struct GetPokemonListImpl: GetPokemonList {
    
    let repository: PokemonListRepository
    
    init(repository: PokemonListRepository) {
        self.repository = repository
    }
    
    func getPokemonList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ()) {
        repository.getPokemonsList(completion: completion, failure: failure)
    }
    
}
