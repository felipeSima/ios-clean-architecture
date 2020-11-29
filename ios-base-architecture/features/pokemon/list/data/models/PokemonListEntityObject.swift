//
//  PokemonListEntityObject.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import Foundation
import RealmSwift

class PokemonListEntityObject: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var pokemonId: Int = 0
    @objc dynamic var imageUrl: String = ""
    
    convenience init(name: String, pokemonId: Int, imageUrl: String){
        self.init()
        self.name = name
        self.pokemonId = pokemonId
        self.imageUrl = imageUrl
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
}
