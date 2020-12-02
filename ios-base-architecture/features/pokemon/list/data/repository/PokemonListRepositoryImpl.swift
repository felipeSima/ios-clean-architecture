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

    func getPokemonsList(dataOrigin: DataOrigin, completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
        switch dataOrigin {
        case .local:
            localDatasource.getPokemonList(completion: completion)
        case .remote:
            remoteDatasource.getPokemonsList { result in
                self.localDatasource.storeOnCache(result)
                completion(result)
            }
        }
    }

    func getPokemon(dataOrigin: DataOrigin, name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void){
        remoteDatasource.getPokemon(name: name, completion: completion)
    }

}
