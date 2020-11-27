//
//  DepedencyInjection.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Swinject

class DepedencyInjection {
    
    /**
     The container constant is the responsible parameter to handle the Dependency injection in the project.
     */
    
    static var container: Container = {
        let container = Container()
        
        //MARK: PokemonList
        
        container.register(PokemonListRemoteDatasource.self) { r in PokemonListRemoteDatasourceImpl()}
        container.register(PokemonListRepository.self) { r in PokemonListRepositoryImpl(datasource: r.resolve(PokemonListRemoteDatasource.self)!)}
        container.register(GetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(PokemonListRepository.self)!)}
        
        //MARK: PokemonDetail
        
        container.register(PokemonDetailRemoteDatasource.self) { r in PokemonDetailRemoteDatasourceImpl()}
        container.register(PokemonDetailRepository.self) { r in PokemonDetailRepositoryImpl(datasource: r.resolve(PokemonDetailRemoteDatasource.self)!)}
        container.register(GetPokemonDetail.self) { r in GetPokemonDetailImpl(repository: r.resolve(PokemonDetailRepository.self)!)}
        return container
    }()
}


