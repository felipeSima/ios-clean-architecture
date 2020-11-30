//
//  PokemonListRepositoryImpl.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

//The Main purpose of the Repository implementation is to either decide to get data from the remotedasource or the local datasource, and store in cache case needed.

class PokemonListRepositoryImpl: PokemonListRepository {
    
    let localDatasource: PokemonListLocalDataSource
    let remoteDatasource: PokemonListRemoteDatasource
    
    init(remoteDatasource: PokemonListRemoteDatasource, localDatasource: PokemonListLocalDataSource){
        self.localDatasource = localDatasource
        self.remoteDatasource = remoteDatasource
    }
    
    func getPokemonsList(dataOrigin: DataOrigin, completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ()) {
        
        switch dataOrigin {
        case .local:
            localDatasource.getPokemonList(completion: completion, failure: failure)
        case .remote:
            remoteDatasource.getPokemonsList { pokemonModel in
                self.localDatasource.storeOnCache(pokemonModel)
                completion(pokemonModel)
            } failure: { serverError in
                failure(serverError)
            }

        }
    }
    
    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()){
        remoteDatasource.getPokemon(name: name, completion: completion, failure: failure)
    }

}
