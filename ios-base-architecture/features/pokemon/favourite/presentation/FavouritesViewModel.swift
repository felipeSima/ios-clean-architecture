//
//  FavouritesViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

class FavouritesViewModel {

    var usecase: IGetPokemonList

    var pokemons = [PokemonEntity]()

    init(usecase: IGetPokemonList){
        self.usecase = usecase
    }

    func getFavouritedPokemons(onComplete: @escaping ([PokemonEntity]) -> Void, onFailure: @escaping (Fail) -> Void){
        usecase.getPokemonList(dataOrigin: .local) { result in
            switch result {
            case let .success(pokemonListModel):
                self.handleSuccess(pokemonListModel.results, onComplete: onComplete)
            case let .failure(error):
                onFailure(Fail.unown)
            }
        }
    }

    private func handleSuccess(_ pokemonList: [Pokemon], onComplete: @escaping ([PokemonEntity]) -> Void){
        pokemonList.forEach { pokemon in
            usecase.getPokemon(dataOrigin: .local, name: pokemon.name) { result in
                switch result {
                case let .success(pokemonModel):
                    self.getPokemonDetail(pokemonModel)
                    onComplete(self.pokemons)
                case let .failure(error):
                    self.handleFailure(error)
                }
            }
        }
    }

    private func getPokemonDetail(_ pokemonModel: PokemonModel) {
        let pokemon = PokemonEntity(name: pokemonModel.name, pokemonId: pokemonModel.id, imageUrl: pokemonModel.sprites.front_default)
        pokemons.append(pokemon)
    }

    func handleFailure(_ serverError: Error){
    }

}
