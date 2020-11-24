//
//  LoginRepository.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/20/20.
//

import Foundation

protocol LoginRepository {
    func post(user: String, password: String)
}
