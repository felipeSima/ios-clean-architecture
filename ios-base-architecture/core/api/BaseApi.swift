//
//  BaseApi.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Moya

enum Authorization {
    case requireAuthorization
    case anonymous
}

protocol BaseApi: TargetType{
    var requiresAuthorization: Authorization {get}
}

extension BaseApi {
    
    var environmentBaseUrl : String {
        switch NetworkManager.environment {
        case .production:
            return "https://pokeapi.co/api/v2/"
        case .staging:
            return "https://pokeapi.co/api/v2/"
        case .qa:
            return "https://pokeapi.co/api/v2/"
        case .developing:
            return "https://pokeapi.co/api/v2/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else { fatalError("Error cannot be configured") }
        return url
    }
    
    var sampleData: Data{
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
