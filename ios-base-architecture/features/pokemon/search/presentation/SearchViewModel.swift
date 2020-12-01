//
//  SearchViewModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

class SearchViewModel {

    var usecase: GetPokemonDetail
    var pokemon = [PokemonListEntity]()
    let debouncer = Debouncer(timeInterval: 0.8)

    init(usecase: GetPokemonDetail){
        self.usecase = usecase
    }

    func requestSuggestions(_ queryStringLength: Int, _ queryString: String, _ onComplete: @escaping (([String]) -> Void)){
        debouncer.renewInterval()
        if queryStringLength >= 4 {
            debouncer.handler = {
                self.getSearchSuggestions(queryString, onComplete)
            }
        }
    }

    func getSearchSuggestions(_ queryString: String, _ onComplete: @escaping (([String]) -> Void)){

    }

    func getPokemon(from name: String, onComplete: @escaping (PokemonListEntity) -> Void, onFailure: @escaping (ServerError) -> Void){
        usecase.getPokemonDetail(name: name, onComplete, onFailure)
    }

}
