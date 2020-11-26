//
//  PokemonListRemoteDatasource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

protocol PokemonListRemoteDatasource: BaseService<PokemonApi> {
    func getPokemonsList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemon(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemon(id: Int, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
}

class PokemonListRemoteDatasourceImpl: BaseService<PokemonApi>, PokemonListRemoteDatasource {
    
    static let environment: BaseEnvironment = .developing
    
    func getPokemonsList(completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ()) {
        let offset: Int = 0
        let limit: Int = 20
        provider.request(.getNextPokemons(offset: offset, limit: limit)) { result in
            switch result{
            case let .success(response):
                do{
                    let pokemonList = try JSONDecoder().decode(PokemonListModel.self, from: response.data)
                    completion(pokemonList)
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                failure(ServerError(errorMessage: error.errorDescription, statusCode: error.errorCode))
            }
        }
    }
    
    func getPokemon(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()) {
        provider.request(.getPokemonByName(name: name)) { result in
            switch result{
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode(PokemonModel.self, from: response.data)
                    completion(results)
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                failure(ServerError(errorMessage: error.errorDescription, statusCode: error.errorCode))
            }
        }
    }
    
    func getPokemon(id: Int, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()) {
        provider.request(.getPokemonById(id: id)) { result in
            switch result{
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode(PokemonModel.self, from: response.data)
                    completion(results)
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                failure(ServerError(errorMessage: error.errorDescription, statusCode: error.errorCode))
            }
        }
    }
    
    
}
