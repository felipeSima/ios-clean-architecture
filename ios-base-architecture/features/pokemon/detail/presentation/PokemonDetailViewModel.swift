//
//  PokemonDetailViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

struct PokemonDetailViewModel {
    
    var pokemon: PokemonListEntity
    var usecase: GetPokemonDetail
    
    init(pokemon: PokemonListEntity, usecase: GetPokemonDetail){
        self.pokemon = pokemon
        self.usecase = usecase
    }
    
    func getPokemonDetail(_ onComplete: @escaping (PokemonListEntity) -> (), _ onFailure: @escaping (ServerError) -> ()){
        usecase.getPokemonDetail(name: pokemon.name, onComplete, onFailure)
    }
    
}
