//
//  PokemonListRemoteDatasource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Moya
import Alamofire

protocol IPokemonListRemoteDatasource {
    func getPokemonsList(completion: @escaping (Result<PokemonListModel, Error>) -> Void)
    func getPokemon(name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void)
    func getPokemon(id: Int, completion: @escaping (Result<PokemonModel, Error>) -> Void)
}

class PokemonListRemoteDatasourceImpl: BaseService<PokemonApi>, IPokemonListRemoteDatasource {
    static let environment: BaseEnvironment = .developing
    func getPokemonsList(completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
        //Fixed values only for tests purposes
        let offset: Int = 0
        let limit: Int = 20
        provider.request(.getNextPokemons(offset: offset, limit: limit)) { result in
            completion(self.mapResponse(result))
        }
    }
    func getPokemon(name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
        provider.request(.getPokemonByName(name: name)) { result in
            completion(self.mapResponse(result))
        }
    }
    func getPokemon(id: Int, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
        provider.request(.getPokemonById(id: id)) { result in
            completion(self.mapResponse(result))
        }
    }
}

/*
class PokemonListRemoteDataSource2Impl: PokemonListRemoteDatasource {
    func getPokemonsList(completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
        _ = AF.request("https://pokeapi.co/api/v2//pokemon/1")
            .validate()
            .responseDecodable(of: PokemonModel.self) { response in
          guard let pokemonListModel = response.value else { return }
            print(pokemonListModel)
        }
    }
    func getPokemon(name: String, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
        _ = AF.request("https://pokeapi.co/api/v2/")
            .validate()
            .responseDecodable(of: PokemonListModel.self) { response in
          guard let pokemonListModel = response.value else { return }
            print(pokemonListModel)
        }
    }
    func getPokemon(id: Int, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
        _ = AF.request("https://pokeapi.co/api/v2/")
            .validate()
            .responseDecodable(of: PokemonListModel.self) { response in
          guard let pokemonListModel = response.value else { return }
            print(pokemonListModel)
        }
    }
}
*/
