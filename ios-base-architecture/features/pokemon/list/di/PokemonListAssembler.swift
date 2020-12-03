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
        container.register(IPokemonListRemoteDatasource.self) { _ in
            PokemonListRemoteDatasourceImpl()}
            //PokemonListRemoteDataSource2Impl()}
        container.register(IPokemonListLocalDataSource.self) { _ in PokemonListLocalDataSourceImpl()}
        container.register(IPokemonListRepository.self) { r in PokemonListRepositoryImpl(remoteDatasource: r.resolve(IPokemonListRemoteDatasource.self)!, localDatasource: r.resolve(IPokemonListLocalDataSource.self)!)}
        container.register(IGetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(IPokemonListRepository.self)!)}
    }
}
