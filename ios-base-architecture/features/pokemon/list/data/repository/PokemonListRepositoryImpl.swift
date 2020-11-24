//
//  PokemonListRepositoryImpl.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

//The Main purpose of the Repository implementation is to either decide to get data from the remotedasource or the local datasource, and store in cache case needed.

class PokemonListRepositoryImpl: PokemonListRepository {
    
    let datasource: PokemonListRemoteDatasource
    
    init(datasource: PokemonListRemoteDatasource){
        self.datasource = datasource
    }
    
    func getPokemonsList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ()) {
        
        //Verify if is cached case not in cache get from
        datasource.getPokemonsList(completion: completion, failure: failure)
    }
}
