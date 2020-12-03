//
//  PokemonDetailViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

struct PokemonDetailViewModel {

    var pokemon: PokemonEntity
    var usecase: IGetPokemonDetail

    init(pokemon: PokemonEntity, usecase: IGetPokemonDetail){
        self.pokemon = pokemon
        self.usecase = usecase
    }

    func getPokemonDetail(_ onComplete: @escaping (PokemonEntity) -> Void, _ onFailure: @escaping (ServerError) -> Void){
        usecase.getPokemonDetail(name: pokemon.name, onComplete, onFailure)
    }

}
