//
//  PokemonListAssembler.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 12/1/20.
//

import Foundation
import Swinject

class PokemonListAssembler: Assembly {
    func assemble(container: Container) {
        container.register(PokemonListRemoteDatasource.self) { _ in PokemonListRemoteDatasourceImpl()}
        container.register(PokemonListLocalDataSource.self) { _ in PokemonListLocalDataSourceImpl()}
        container.register(PokemonListRepository.self) { r in PokemonListRepositoryImpl(remoteDatasource: r.resolve(PokemonListRemoteDatasource.self)!, localDatasource: r.resolve(PokemonListLocalDataSource.self)!)}
        container.register(GetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(PokemonListRepository.self)!)}
    }
}
