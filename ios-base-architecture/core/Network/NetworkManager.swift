//
//  NetworkManager.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation
import Moya


protocol Networkable {
}

struct NetworkManager: Networkable {

    static let environment: BaseEnvironment = .developing

}
