//
//  PokemonDetailDatasource.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation
import Moya

protocol PokemonDetailDatasource: BaseService<PokemonApi> {
    func getPokemonDetail(name: String, _ completion: @escaping (PokemonModel) -> Void, _ failure: @escaping (ServerError) -> Void)
}

class PokemonDetailDatasourceImpl: BaseService<PokemonApi>, PokemonDetailDatasource {
    func getPokemonDetail(name: String, _ completion: @escaping (PokemonModel) -> Void, _ failure: @escaping (ServerError) -> Void) {
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
    
}
