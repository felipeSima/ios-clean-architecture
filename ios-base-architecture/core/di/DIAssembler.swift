//
//  DIAssembler.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 12/1/20.
//

import Foundation
import Swinject

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
