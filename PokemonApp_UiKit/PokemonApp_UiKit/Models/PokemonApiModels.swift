//
//  PokemonApiModels.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//

import Foundation

struct PokemontListModel: Decodable {
    
    let pokemonSpecies: [PokemonId]

    enum CodingKeys: String, CodingKey {
        case pokemonSpecies = "pokemon_species"
    }
    
}

struct PokemonId: Decodable {
    let name: String
    let url: String
    var pokemonImg: PokemonImageModel?
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

// MARK: - POKEMON SPECIES MODELS

struct PokemonImageModel: Decodable {
    let height: Int
    let name: String
    let sprites: Sprites
    let stats: [StatElement]
    let weight: Int
}

struct Sprites: Decodable {
    let frontDefault: String
    let other: Other

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
}

struct Other: Decodable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

struct DreamWorld: Decodable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Home: Decodable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct OfficialArtwork: Decodable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct StatElement: Decodable {
    let baseStat, effort: Int
    let stat: StatStat

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct StatStat: Decodable {
    let name: String
    let url: String
}

// MARK: - POKEMON GENERAL INFO MODEL

struct PokemonGeneralInfoModel: Decodable {
    let eggGroups: [EggGroup]
    var flavorTextEntries: [FlavorTextEntry]
    var genera: [Genus]
    let name: String

    enum CodingKeys: String, CodingKey {
        case eggGroups = "egg_groups"
        case flavorTextEntries = "flavor_text_entries"
        case genera, name
    }
}

// MARK: - EggGroup
struct EggGroup: Decodable {
    let name: String
    let url: String
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Decodable {
    let flavorText: String
    let language: EggGroup

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

// MARK: - Genus
struct Genus: Decodable {
    let genus: String
    let language: EggGroup
}

