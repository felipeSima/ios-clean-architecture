//
//  PokemonListViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

class PokemonListViewModel {
    
    var usecase: GetPokemonList
    
    var pokemons = [PokemonListEntity]()
    
    init(usecase: GetPokemonList){
        self.usecase = usecase
    }
    
    func getPokemonList(onComplete: @escaping ([PokemonListEntity]) -> (), onFailure: @escaping (ServerError)-> Void){
        usecase.getPokemonList { pokemons in
            self.handleSuccess(pokemons.results, onComplete: onComplete)
        } failure: { serverError in
            self.handleFailure(serverError)
            onFailure(serverError)
        }

    }
    
    func handleSuccess(_ pokemonList: [Pokemon], onComplete: @escaping ([PokemonListEntity]) -> ()){
        pokemonList.forEach { pokemon in
            usecase.getPokemon(name: pokemon.name) { poke in
                self.getPokemonDetail(poke)
                onComplete(self.pokemons)
            } failure: { serverError in
                self.handleFailure(serverError)
            }
        }
    }
    
    func getPokemonDetail(_ pokemonModel: PokemonModel) {
        let pokemon = PokemonListEntity(name: pokemonModel.name, imageUrl: pokemonModel.sprites.front_default)
        pokemons.append(pokemon)
    }
    
    func handleFailure(_ serverError: ServerError){
        
    }
    
    
}
