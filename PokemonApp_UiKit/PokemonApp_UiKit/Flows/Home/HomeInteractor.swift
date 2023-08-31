//
//  HomeInteractor.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    
    func viewDidLoad(callback: @escaping ([PokemonId]) -> Void) {
        Task {
            await WebService.getPokemonList { pokemonList in
                callback(pokemonList?.pokemonSpecies ?? [])
            }
        }
    }
    
    func getPokemonImg(pokemonName: String) async -> PokemonImageModel? {
        return await WebService.getPokemonImg(pokemonName: pokemonName.lowercased())
    }
    
    func getPokemonInfo(pokemonName: String) async -> PokemonGeneralInfoModel? {
        
        if var pokemonInfo = await WebService.getPokemonInfo(pokemonName: pokemonName.lowercased()) {
            pokemonInfo.flavorTextEntries = pokemonInfo.flavorTextEntries.filter({$0.language.name == "es"})
            pokemonInfo.genera = pokemonInfo.genera.filter({$0.language.name == "es"})
            return pokemonInfo
        }
        
        return nil
    }

}

