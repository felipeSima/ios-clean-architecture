//
//  PokemonListRemoteDatasource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

protocol PokemonListRemoteDatasource: BaseService<PokemonApi> {
    func getPokemonsList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ())
}

class PokemonListRemoteDatasourceImpl: BaseService<PokemonApi>, PokemonListRemoteDatasource {
    
    static let environment: BaseEnvironment = .developing
    
    func getPokemonsList(completion: @escaping (PokemonListEntity) -> (), failure: @escaping (ServerError) -> ()) {
        let offset: Int = 0
        let limit: Int = 20
        provider.request(.getNextPokemons(offset: offset, limit: limit)) { result in
            switch result{
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode(PokemonListModel.self, from: response.data)
                    completion(results.convertToEntity())
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                failure(ServerError(errorMessage: error.errorDescription, statusCode: error.errorCode))
            }
        }
    }
}
