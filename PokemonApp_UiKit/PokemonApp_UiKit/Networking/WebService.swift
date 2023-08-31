//
//  WebService.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//

import Foundation

class WebService {
    
    static func getPokemonList(callback: @escaping (PokemontListModel?) -> Void) async {
        
        let urlString = "\(ApiPath.pokemonBaseUrl)\(ApiPath.firstGenEndPoint)"
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(PokemontListModel.self, from: data)
                callback(decodedResponse)
            } catch let error {
                print("Error: ", error.localizedDescription)
                callback(nil)
            }
        }
        
    }
    
    static func getPokemonImg(pokemonName: String) async -> PokemonImageModel? {
        
        let urlString = "\(ApiPath.pokemonBaseUrl)\(ApiPath.pokemonImageEndPoint)\(pokemonName)"
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(PokemonImageModel.self, from: data)
                return decodedResponse
            } catch let error {
                print(error.localizedDescription)
                return nil
                
            }
        } else {
            return nil
        }
        
    }
    
    static func getPokemonInfo(pokemonName: String) async -> PokemonGeneralInfoModel? {
        
        let urlString = "\(ApiPath.pokemonBaseUrl)\(ApiPath.pokemonDetailEndPoint)\(pokemonName)"
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(PokemonGeneralInfoModel.self, from: data)
                return decodedResponse
            } catch let error {
                print(error.localizedDescription)
                return nil
                
            }
        } else {
            return nil
        }
        
    }
    
    
    
    
    
}
