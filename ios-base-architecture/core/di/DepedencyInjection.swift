//
//  DepedencyInjection.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Swinject

class DepedencyInjection {
    
    static let container: Container = {
        let container = Container()
        container.register(PokemonListRemoteDatasource.self) { r in PokemonListRemoteDatasourceImpl()}
        container.register(PokemonListRepository.self) { r in PokemonListRepositoryImpl(datasource: r.resolve(PokemonListRemoteDatasource.self)!)}
        container.register(GetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(PokemonListRepository.self)!)}
        container.register(PokemonListViewController.self) { r in
            let pokemonListVC = PokemonListViewController(usecase: r.resolve(GetPokemonList.self)!)
            return pokemonListVC
        }
        return container
    }()
    
}
