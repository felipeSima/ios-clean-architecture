//
//  FavouritesViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

class FavouritesViewModel {
    
    var usecase: GetPokemonList
    
    var pokemons = [PokemonListEntity]()
    
    init(usecase: GetPokemonList){
        self.usecase = usecase
    }
    
}
