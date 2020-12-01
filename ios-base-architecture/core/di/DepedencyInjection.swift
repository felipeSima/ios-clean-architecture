//
//  DepedencyInjection.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import Swinject

class DepedencyInjection {
    static var container: Container = {
        let container = Container()

        // MARK: PokemonList

        container.register(PokemonListRemoteDatasource.self) { _ in PokemonListRemoteDatasourceImpl()}
        container.register(PokemonListLocalDataSource.self) { _ in PokemonListLocalDataSourceImpl()}
        container.register(PokemonListRepository.self) { r in PokemonListRepositoryImpl(remoteDatasource: r.resolve(PokemonListRemoteDatasource.self)!, localDatasource: r.resolve(PokemonListLocalDataSource.self)!)}
        container.register(GetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(PokemonListRepository.self)!)}

        // MARK: PokemonDetail

        container.register(PokemonDetailRemoteDatasource.self) { _ in PokemonDetailRemoteDatasourceImpl()}
        container.register(PokemonDetailRepository.self) { r in PokemonDetailRepositoryImpl(datasource: r.resolve(PokemonDetailRemoteDatasource.self)!)}
        container.register(GetPokemonDetail.self) { r in GetPokemonDetailImpl(repository: r.resolve(PokemonDetailRepository.self)!)}
        return container
    }()
}

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([
            PokemonListAssembler(),
            PokemonDetailAssembler()
        ], container: container)
        return assembler
    }()
}

class PokemonListAssembler: Assembly {
    func assemble(container: Container) {
        container.register(PokemonListRemoteDatasource.self) { _ in PokemonListRemoteDatasourceImpl()}
        container.register(PokemonListLocalDataSource.self) { _ in PokemonListLocalDataSourceImpl()}
        container.register(PokemonListRepository.self) { r in PokemonListRepositoryImpl(remoteDatasource: r.resolve(PokemonListRemoteDatasource.self)!, localDatasource: r.resolve(PokemonListLocalDataSource.self)!)}
        container.register(GetPokemonList.self) { r in GetPokemonListImpl(repository: r.resolve(PokemonListRepository.self)!)}
    }
}

class PokemonDetailAssembler: Assembly {
    func assemble(container: Container) {
        container.register(PokemonDetailRemoteDatasource.self) { _ in PokemonDetailRemoteDatasourceImpl()}
        container.register(PokemonDetailRepository.self) { r in PokemonDetailRepositoryImpl(datasource: r.resolve(PokemonDetailRemoteDatasource.self)!)}
        container.register(GetPokemonDetail.self) { r in GetPokemonDetailImpl(repository: r.resolve(PokemonDetailRepository.self)!)}
    }
}

