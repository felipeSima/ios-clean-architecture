//
//  BaseMoyaProvider.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

import Moya

class BaseMoyaProvider<Target>: MoyaProvider<Target> where Target: Moya.TargetType {

    func mapResponse<T: Codable>(_ result: Result<Response, MoyaError>) -> Result<T, Error> {
        switch result {
        case let .success(response):
            do {
                _ = try response.filterSuccessfulStatusCodes()
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let body = try response.map(T.self, using: decoder, failsOnEmptyData: false)
                return .success(body)
            } catch {
                if let error = error as? MoyaError {
                    do {
                        let response = try error.response?.map(ErrorResponse.self)
                        return .failure(response!)
                    } catch {
                        print(error)
                        return .failure(error)
                    }
                } else {
                    return .failure(error)
                }
            }
        case let .failure(error):
            print(error)
            return .failure(error)
        }
    }
}
