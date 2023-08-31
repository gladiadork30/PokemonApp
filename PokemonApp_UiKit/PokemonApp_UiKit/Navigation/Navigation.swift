//
//  Navigation.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 29/08/23.
//

import Foundation
import UIKit

class Navigation {
    
    static func getCurrentController() -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.globalNavigationController?.viewControllers.last
    }
    
    static func showPokemonDetail(pokeData: PokemonId, pokeInfo: PokemonGeneralInfoModel?) {
        
        let modalViewController = PokemonDetailModal(nibName: "PokemonDetailModal", bundle: nil)
        modalViewController.pokemonData = pokeData
        modalViewController.pokemonInfo = pokeInfo
        modalViewController.modalPresentationStyle = .overFullScreen
        modalViewController.modalTransitionStyle = .coverVertical
        modalViewController.isModalInPresentation = true
        
        let currentController = Navigation.getCurrentController()
        currentController!.present(modalViewController, animated: true, completion: nil)
    }
    
}
