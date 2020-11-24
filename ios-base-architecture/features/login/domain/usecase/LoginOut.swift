//
//  LoginOut.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

protocol LoginOut {
    func loginOut()
}

class LoginOutImpl: LoginOut {
    func loginOut() {
        print("Logout")
    }
}
