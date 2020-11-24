//
//  BaseService.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Moya

class BaseService<T: TargetType> {
    internal var provider = BaseMoyaProvider<T>()

    func mapResponse<T: Codable>(_ result: Result<Response, MoyaError>) -> Result<T, Error> {
        return provider.mapResponse(result)
    }

}
