//
//  PokemonListLocalDataSource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import Foundation

protocol IPokemonListLocalDataSource {
    func storeOnCache(_ result: Result<PokemonListModel, Error>)
    func getPokemonList(completion: @escaping (Result<PokemonListModel, Error>) -> Void)
}

struct PokemonListLocalDataSourceImpl: IPokemonListLocalDataSource {

    func storeOnCache(_ result: Result<PokemonListModel, Error>){
        switch result {
        case let .success(pokemonListModel):
            RealmManager.shared.save(object: pokemonListModel.convertToObject(), update: .modified)
        case let .failure(error):
            print(error.localizedDescription)
        }
        
    }

    func getPokemonList(completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
        guard let pokemonListObject = RealmManager.shared.fetchObject(ofType: PokemonListObject.self) else { return }
        completion(.success(pokemonListObject.convertToModel()))
    }

}
