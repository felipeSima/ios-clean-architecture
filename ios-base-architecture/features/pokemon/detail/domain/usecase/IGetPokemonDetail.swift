//
//  GetPokemonDetail.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

protocol IGetPokemonDetail {
    func getPokemonDetail(name: String, _ completion: @escaping (PokemonEntity) -> Void, _ failure: @escaping (ServerError) -> Void)
}

struct GetPokemonDetailImpl: IGetPokemonDetail {

    let repository: IPokemonDetailRepository

    func getPokemonDetail(name: String, _ completion: @escaping (PokemonEntity) -> Void, _ failure: @escaping (ServerError) -> Void) {
        repository.getPokemonDetail(name: name, completion, failure)
    }

}
