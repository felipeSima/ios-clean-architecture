//
//  LoginIn.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

protocol LoginIn {
    func loginIn(user: String, password: String, onComplete: @escaping (Result<Int,Error>) -> Void)
}

class LoginInImpl: LoginIn {
    
    var repository: LoginRepository!
    
    func loginIn(user: String, password: String, onComplete: (Result<Int, Error>) -> Void) {
        
        let error = validateCredentials(user: user, password: password)
        
        if (error != nil){
            onComplete(.failure(Fail.badResquest))
            return
            //Return Failure or Rejection
        }
        
        repository.post(user: user, password: password)
    }
    
    func validateCredentials(user: String, password: String) -> Failure? {
        if !(user != "" && password.count > 6){
            return InvalidLoginFailure()
        }
        return nil
    }
    
}
