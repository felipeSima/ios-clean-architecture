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
        container.register(IPokemonDetailRemoteDatasource.self) { _ in PokemonDetailRemoteDatasourceImpl()}
        container.register(IPokemonDetailRepository.self) { r in PokemonDetailRepositoryImpl(datasource: r.resolve(IPokemonDetailRemoteDatasource.self)!)}
        container.register(IGetPokemonDetail.self) { r in GetPokemonDetailImpl(repository: r.resolve(IPokemonDetailRepository.self)!)}
    }
}
