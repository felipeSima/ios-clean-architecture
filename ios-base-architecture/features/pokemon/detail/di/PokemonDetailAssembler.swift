//
//  PokemonDetailAssembler.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 12/1/20.
//

import Foundation
import Swinject

class PokemonDetailAssembler: Assembly {
    func assemble(container: Container) {
        container.register(PokemonDetailRemoteDatasource.self) { _ in PokemonDetailRemoteDatasourceImpl()}
        container.register(PokemonDetailRepository.self) { r in PokemonDetailRepositoryImpl(datasource: r.resolve(PokemonDetailRemoteDatasource.self)!)}
        container.register(GetPokemonDetail.self) { r in GetPokemonDetailImpl(repository: r.resolve(PokemonDetailRepository.self)!)}
    }
}
