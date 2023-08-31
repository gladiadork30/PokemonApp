//
//  PokemonDetailModal.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 29/08/23.
//

import UIKit

class PokemonDetailModal: UIViewController {

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var pokemonData: PokemonId?
    var pokemonInfo: PokemonGeneralInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        boxView.layer.cornerRadius = 20
        pokeName.text = pokemonData?.name.uppercased()
        
        if let url = pokemonData?.pokemonImg?.sprites.other.officialArtwork.frontDefault {
            pokeImg.loadFrom(URLAddress: url)
        }
        
        if let stats = pokemonData?.pokemonImg?.stats {
            for  stat in stats {
                switch stat.stat.name {
                case "hp":
                    hpLabel.text = stat.baseStat.description
                case "attack":
                    attackLabel.text = stat.baseStat.description
                case "defense":
                    defenseLabel.text = stat.baseStat.description
                case "speed":
                    speedLabel.text = stat.baseStat.description
                default:
                    break
                }
            }
        }
        
        if let pokeInfo = pokemonInfo {
            
            var type: String = ""
            for types in pokeInfo.eggGroups {
                type.append("\(types.name.capitalized) ")
            }
            typeLabel.text = type
            
            if let gender = pokeInfo.genera.first?.genus {
                genderLabel.text = gender.capitalized
            }
            
            var desc: String = ""
            for flavor in pokeInfo.flavorTextEntries {
                desc.append("\(flavor.flavorText.replacingOccurrences(of: "\n", with: " "))\n\n")
            }
            descriptionLabel.text = desc
            
        }
        
    }

    @IBAction func closeBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
