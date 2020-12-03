//
//  GetPokemonList.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Moya
import Swinject

protocol IGetPokemonList {
    func getPokemonList(dataOrigin: DataOrigin, completion: @escaping (Result<PokemonListModel, Error>) -> Void)
    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void)
}

struct GetPokemonListImpl: IGetPokemonList {
    let repository: IPokemonListRepository

    init(repository: IPokemonListRepository) {
        self.repository = repository
    }
    
    func getPokemonList(dataOrigin: DataOrigin, completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
        repository.getPokemonsList(dataOrigin: dataOrigin, completion: completion)
    }

    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
        repository.getPokemon(dataOrigin: dataOrigin, name: name, completion: completion)
    }

}
