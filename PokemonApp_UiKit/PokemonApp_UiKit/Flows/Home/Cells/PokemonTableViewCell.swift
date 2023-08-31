//
//  PokemonTableViewCell.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 29/08/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonIco: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var boxView: UIView!
    
    func initCell(pokemon: PokemonId) {
        super.awakeFromNib()
        // Initialization code
        pokemonName.text = pokemon.name.capitalized
        boxView.layer.cornerRadius = 20
        
        if let url = pokemon.pokemonImg?.sprites.frontDefault {
            pokemonIco.loadFrom(URLAddress:  url)
        }
        
        
    }


    
}
