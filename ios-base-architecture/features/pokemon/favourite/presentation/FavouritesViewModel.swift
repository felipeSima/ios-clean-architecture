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

    func getFavouritedPokemons(onComplete: @escaping ([PokemonListEntity]) -> Void, onFailure: @escaping (ServerError) -> Void){
        usecase.getPokemonList(dataOrigin: .local) { pokemons in
            self.handleSuccess(pokemons.results, onComplete: onComplete)
        } failure: { serverError in
            self.handleFailure(serverError)
            onFailure(serverError)
        }

    }

    private func handleSuccess(_ pokemonList: [Pokemon], onComplete: @escaping ([PokemonListEntity]) -> Void){
        pokemonList.forEach { pokemon in
            usecase.getPokemon(dataOrigin: .local, name: pokemon.name) { poke in
                self.getPokemonDetail(poke)
                onComplete(self.pokemons)
            } failure: { serverError in
                self.handleFailure(serverError)
            }
        }
    }

    private func getPokemonDetail(_ pokemonModel: PokemonModel) {
        let pokemon = PokemonListEntity(name: pokemonModel.name, pokemonId: pokemonModel.id, imageUrl: pokemonModel.sprites.front_default)
        pokemons.append(pokemon)
    }

    func handleFailure(_ serverError: ServerError){
    }

}
