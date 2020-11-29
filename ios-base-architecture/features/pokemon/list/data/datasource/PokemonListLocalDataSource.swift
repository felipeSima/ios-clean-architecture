//
//  PokemonListLocalDataSource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import Foundation

protocol PokemonListLocalDataSource {
    func storeOnCache(_ pokemonModel: PokemonListModel)
    func getPokemonList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ())
}

struct PokemonListLocalDataSourceImpl: PokemonListLocalDataSource {
    
    func storeOnCache(_ pokemonModel: PokemonListModel){
        RealmManager.shared.save(object: pokemonModel.convertToObject(), update: .modified)
    }
    
    
    func getPokemonList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ()) {
        guard let pokemonListObject = RealmManager.shared.fetchObject(ofType: PokemonListObject.self) else { return }
        completion(pokemonListObject.convertToModel())
    }
    
}
