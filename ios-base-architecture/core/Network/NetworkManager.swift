//
//  NetworkManager.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation
import Moya


protocol Networkable {
    var provider: MoyaProvider<PokemonApi> {get}
    func getPokemonsList(offset: Int, limit: Int, completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemonBy(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
    func getPokemonBy(id: Int, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ())
}

struct NetworkManager: Networkable {
    
    var provider = MoyaProvider<PokemonApi>(plugins: [NetworkLoggerPlugin()])
    static let environment: BaseEnvironment = .developing
    
    func getPokemonsList(offset: Int = 0, limit: Int = 20, completion: @escaping (PokemonListModel) -> (), failure: @escaping (ServerError) -> ()) {
        provider.request(.getNextPokemons(offset: offset, limit: limit)) { result in
            switch result{
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode(PokemonListModel.self, from: response.data)
                    completion(results)
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                failure(ServerError(errorMessage: error.errorDescription, statusCode: error.errorCode))
            }
        }
    }
    
    func getPokemonBy(name: String, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()) {
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
    
    func getPokemonBy(id: Int, completion: @escaping (PokemonModel) -> (), failure: @escaping (ServerError) -> ()) {
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
