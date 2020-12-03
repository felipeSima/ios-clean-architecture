//
//  PokemonListViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation

class PokemonListViewModel {

    var usecase: GetPokemonList

    var pokemons = [PokemonEntity]()

    var pokemonsFiltered: [PokemonEntity] {
        let pokemonList = pokemons.sorted(by: { $0.pokemonId < $1.pokemonId })
        return pokemonList
    }

    var searchedPokemons = [PokemonEntity]()

    init(usecase: GetPokemonList){
        self.usecase = usecase
    }

    func getPokemonList(from dataOrigin: DataOrigin, onComplete: @escaping ([PokemonEntity]) -> Void, onFailure: @escaping (Fail) -> Void){
        usecase.getPokemonList(dataOrigin: dataOrigin) { result in
            switch result {
            case let .success(pokemonListModel):
                self.handleSuccess(with: dataOrigin, pokemonListModel.results, onComplete: onComplete)
            case let .failure(error):
                onFailure(Fail.unown)
            }
        }
    }

    func handleSuccess(with dataOrigin: DataOrigin, _ pokemonList: [Pokemon], onComplete: @escaping ([PokemonEntity]) -> Void){
        pokemonList.forEach { pokemon in
            usecase.getPokemon(dataOrigin: dataOrigin, name: pokemon.name) { result in
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

    func getPokemonDetail(_ pokemonModel: PokemonModel) {
        let pokemon = PokemonEntity(name: pokemonModel.name, pokemonId: pokemonModel.id, imageUrl: pokemonModel.sprites.front_default)
        pokemons.append(pokemon)
    }

    func handleFailure(_ serverError: Error){

    }

}
