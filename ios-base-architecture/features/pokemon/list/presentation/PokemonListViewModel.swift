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

    var pokemonsFiltered: [PokemonListEntity] {
        let pokemonList = pokemons.sorted(by: { $0.pokemonId < $1.pokemonId })
        return pokemonList
    }

    var searchedPokemons = [PokemonListEntity]()

    init(usecase: GetPokemonList){
        self.usecase = usecase
    }

    func getPokemonList(from dataOrigin: DataOrigin, onComplete: @escaping ([PokemonListEntity]) -> Void, onFailure: @escaping (ServerError) -> Void){
        usecase.getPokemonList(dataOrigin: dataOrigin) { pokemons in
            self.handleSuccess(with: dataOrigin, pokemons.results, onComplete: onComplete)
        } failure: { serverError in
            self.handleFailure(serverError)
            onFailure(serverError)
        }

    }

    func handleSuccess(with dataOrigin: DataOrigin, _ pokemonList: [Pokemon], onComplete: @escaping ([PokemonListEntity]) -> Void){
        pokemonList.forEach { pokemon in
            usecase.getPokemon(dataOrigin: dataOrigin, name: pokemon.name) { poke in
                self.getPokemonDetail(poke)
                onComplete(self.pokemons)
            } failure: { serverError in
                self.handleFailure(serverError)
            }
        }
    }

    func getPokemonDetail(_ pokemonModel: PokemonModel) {
        let pokemon = PokemonListEntity(name: pokemonModel.name, pokemonId: pokemonModel.id, imageUrl: pokemonModel.sprites.front_default)
        pokemons.append(pokemon)
    }

    func handleFailure(_ serverError: ServerError){

    }

}
