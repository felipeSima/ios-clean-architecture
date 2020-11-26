//
//  PokemonDetailRepositoryImpl.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

struct PokemonDetailRepositoryImpl: PokemonDetailRepository {
    
    let datasource: PokemonDetailDatasource
    
    func getPokemonDetail(name: String, _ completion: @escaping (PokemonModel) -> Void, _ failure: @escaping (ServerError) -> Void) {
        //datasource.getPokemonDetail(completion, failure)
    }
    
}
