//
//  Failure.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

enum Fail: Error{
    case badResquest
    case unown
}

protocol Failure: Error {
    var error: Int {get set}
    var code: String {get set}
}

struct ServerConnectionFailure: Failure {
    var error: Int
    var code: String
    
    init(error: Int, code: String){
        self.error = error
        self.code = code
    }
}

struct InvalidParamFailure: Failure {
    var error: Int
    var code: String
    
    init(error: Int, code: String){
        self.error = error
        self.code = code
    }
}

struct ServerError: Codable {
    let errorMessage: String?
    let statusCode: Int?
}

struct ErrorResponse: Error, Codable {
    var status: Int
    var title: String?
    var detail: String?
    var type: String?
    var instance: String?
    var failure: String?
}
