//
//  PokemonApi.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation
import Moya

enum PokemonApi {
    case getNextPokemons(offset: Int, limit: Int)
    case getPokemonById(id: Int)
    case getPokemonByName(name: String)
}

extension PokemonApi: BaseApi{

    var requiresAuthorization: Authorization {
        return .anonymous
    }

    var baseURL: URL {
        switch self {
        case .getNextPokemons(let offset, let limit):
            let baseUrlString = "\(environmentBaseUrl)?offset=\(offset)&limit=\(limit)"
            guard let url = URL(string: baseUrlString) else { fatalError("Error cannot be configured")}
            return url
        default:
            guard let url = URL(string: environmentBaseUrl) else { fatalError("Error cannot be configured") }
            return url
        }
    }

    var path: String {
            switch self {
            case .getNextPokemons:
                return "pokemon"
            case .getPokemonById(let id):
                return "pokemon/\(id)/"
            case .getPokemonByName(let name):
                return "pokemon/\(name)/"
            }
        }

    var method: Moya.Method {
        switch self {
        case .getNextPokemons, .getPokemonById, .getPokemonByName: return .get
        }
    }

    var task: Task {
        switch self {
        case .getNextPokemons, .getPokemonById, .getPokemonByName: return .requestPlain
        }
    }

}
