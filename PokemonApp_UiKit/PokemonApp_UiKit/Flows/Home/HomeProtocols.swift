//
//  HomeProtocols.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func updateTableView(_ cell: Int?)
    func setSpinner(show: Bool)
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func numberOfPokemons() -> Int
    func getPokemon(index: Int) -> PokemonId
    func goToPokeDetail(index: Int)
    func searchPokemon(searchHint: String)
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    func viewDidLoad(callback: @escaping ([PokemonId]) -> Void)
    func getPokemonImg(pokemonName: String) async -> PokemonImageModel?
    func getPokemonInfo(pokemonName: String) async -> PokemonGeneralInfoModel?
}
