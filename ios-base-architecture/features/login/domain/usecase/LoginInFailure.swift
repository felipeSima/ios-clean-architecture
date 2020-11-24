//
//  LoginInFailure.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

protocol LoginInFailure: Failure {}
class InvalidLoginFailure: LoginInFailure {
    var error: Int = 0
    var code: String = ""
}
