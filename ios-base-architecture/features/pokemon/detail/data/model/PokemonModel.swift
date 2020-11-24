//
//  PokemonModel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import Foundation

// MARK: - PokemonModel
class PokemonModel: Codable {
    let id: Int
    let name: String
    let baseExperience, height: Int
    let isDefault: Bool
    let order, weight: Int
    let abilities: [Ability]
    let forms: [Species]
    let gameIndices: [GameIndex]
    let heldItems: [HeldItem]
    let locationAreaEncounters: String
    let moves: [Move]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]

    init(id: Int, name: String, baseExperience: Int, height: Int, isDefault: Bool, order: Int, weight: Int, abilities: [Ability], forms: [Species], gameIndices: [GameIndex], heldItems: [HeldItem], locationAreaEncounters: String, moves: [Move], species: Species, sprites: Sprites, stats: [Stat], types: [TypeElement]) {
        self.id = id
        self.name = name
        self.baseExperience = baseExperience
        self.height = height
        self.isDefault = isDefault
        self.order = order
        self.weight = weight
        self.abilities = abilities
        self.forms = forms
        self.gameIndices = gameIndices
        self.heldItems = heldItems
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
    }
}

// MARK: - Ability
class Ability: Codable {
    let isHidden: Bool
    let slot: Int
    let ability: Species

    init(isHidden: Bool, slot: Int, ability: Species) {
        self.isHidden = isHidden
        self.slot = slot
        self.ability = ability
    }
}

// MARK: - Species
class Species: Codable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

// MARK: - GameIndex
class GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    init(gameIndex: Int, version: Species) {
        self.gameIndex = gameIndex
        self.version = version
    }
}

// MARK: - HeldItem
class HeldItem: Codable {
    let item: Species
    let versionDetails: [VersionDetail]

    init(item: Species, versionDetails: [VersionDetail]) {
        self.item = item
        self.versionDetails = versionDetails
    }
}

// MARK: - VersionDetail
class VersionDetail: Codable {
    let rarity: Int
    let version: Species

    init(rarity: Int, version: Species) {
        self.rarity = rarity
        self.version = version
    }
}

// MARK: - Move
class Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    init(move: Species, versionGroupDetails: [VersionGroupDetail]) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
}

// MARK: - VersionGroupDetail
class VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let versionGroup, moveLearnMethod: Species

    init(levelLearnedAt: Int, versionGroup: Species, moveLearnMethod: Species) {
        self.levelLearnedAt = levelLearnedAt
        self.versionGroup = versionGroup
        self.moveLearnMethod = moveLearnMethod
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backFemale, backShinyFemale, backDefault, frontFemale: String
    let frontShinyFemale, backShiny, frontDefault, frontShiny: String
    let other: Other
    let versions: Versions

    init(backFemale: String, backShinyFemale: String, backDefault: String, frontFemale: String, frontShinyFemale: String, backShiny: String, frontDefault: String, frontShiny: String, other: Other, versions: Versions) {
        self.backFemale = backFemale
        self.backShinyFemale = backShinyFemale
        self.backDefault = backDefault
        self.frontFemale = frontFemale
        self.frontShinyFemale = frontShinyFemale
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.other = other
        self.versions = versions
    }
}

// MARK: - Other
class Other: Codable {
    let dreamWorld, officialArtwork: DreamWorld

    init(dreamWorld: DreamWorld, officialArtwork: DreamWorld) {
        self.dreamWorld = dreamWorld
        self.officialArtwork = officialArtwork
    }
}

// MARK: - DreamWorld
class DreamWorld: Codable {

    init() {
    }
}

// MARK: - Versions
class Versions: Codable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: DreamWorld]
    let generationVii: GenerationVii
    let generationViii: GenerationViii

    init(generationI: GenerationI, generationIi: GenerationIi, generationIii: GenerationIii, generationIv: GenerationIv, generationV: GenerationV, generationVi: [String: DreamWorld], generationVii: GenerationVii, generationViii: GenerationViii) {
        self.generationI = generationI
        self.generationIi = generationIi
        self.generationIii = generationIii
        self.generationIv = generationIv
        self.generationV = generationV
        self.generationVi = generationVi
        self.generationVii = generationVii
        self.generationViii = generationViii
    }
}

// MARK: - GenerationI
class GenerationI: Codable {
    let redBlue, yellow: DreamWorld

    init(redBlue: DreamWorld, yellow: DreamWorld) {
        self.redBlue = redBlue
        self.yellow = yellow
    }
}

// MARK: - GenerationIi
class GenerationIi: Codable {
    let crystal, gold, silver: DreamWorld

    init(crystal: DreamWorld, gold: DreamWorld, silver: DreamWorld) {
        self.crystal = crystal
        self.gold = gold
        self.silver = silver
    }
}

// MARK: - GenerationIii
class GenerationIii: Codable {
    let emerald, fireredLeafgreen, rubySapphire: DreamWorld

    init(emerald: DreamWorld, fireredLeafgreen: DreamWorld, rubySapphire: DreamWorld) {
        self.emerald = emerald
        self.fireredLeafgreen = fireredLeafgreen
        self.rubySapphire = rubySapphire
    }
}

// MARK: - GenerationIv
class GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: DreamWorld

    init(diamondPearl: DreamWorld, heartgoldSoulsilver: DreamWorld, platinum: DreamWorld) {
        self.diamondPearl = diamondPearl
        self.heartgoldSoulsilver = heartgoldSoulsilver
        self.platinum = platinum
    }
}

// MARK: - GenerationV
class GenerationV: Codable {
    let blackWhite: DreamWorld

    init(blackWhite: DreamWorld) {
        self.blackWhite = blackWhite
    }
}

// MARK: - GenerationVii
class GenerationVii: Codable {
    let icons, ultraSunUltraMoon: DreamWorld

    init(icons: DreamWorld, ultraSunUltraMoon: DreamWorld) {
        self.icons = icons
        self.ultraSunUltraMoon = ultraSunUltraMoon
    }
}

// MARK: - GenerationViii
class GenerationViii: Codable {
    let icons: DreamWorld

    init(icons: DreamWorld) {
        self.icons = icons
    }
}

// MARK: - Stat
class Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    init(baseStat: Int, effort: Int, stat: Species) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}

// MARK: - TypeElement
class TypeElement: Codable {
    let slot: Int
    let type: Species

    init(slot: Int, type: Species) {
        self.slot = slot
        self.type = type
    }
}
