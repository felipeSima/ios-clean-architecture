//
//  PokemonListObject.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import Foundation
import RealmSwift


// MARK: - PokemonListObject
class PokemonListObject: Object {
    @objc dynamic var count: Int = 0
    @objc dynamic var next: String = ""
    @objc dynamic var previous: Bool = false
    var results = List<PokemonObject>()

    convenience init(count: Int, next: String, previous: Bool, results: List<PokemonObject>) {
        self.init()
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    func convertToModel() -> PokemonListModel {
        let pokemons = Array(self.results).map {
            return Pokemon(name: $0.name, url: $0.url)
        }
        return PokemonListModel(count: self.count, next: self.next, previous: self.previous, results: pokemons)
    }
}

// MARK: - Pokemon
class PokemonObject: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""

    convenience init(name: String, url: String) {
        self.init()
        self.name = name
        self.url = url
    }
    
    func convertToModel() -> Pokemon{
        return Pokemon(name: self.name, url: self.url)
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
