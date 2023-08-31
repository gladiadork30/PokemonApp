//
//  HomePresenter.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//  
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    var pokemonList: [PokemonId] = []
    var pokemonListCopy: [PokemonId] = []
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.setSpinner(show: true)
        interactor?.viewDidLoad(callback: { [weak self] pokemonList in
            self?.pokemonList = pokemonList
            self?.pokemonListCopy = pokemonList
            self?.view?.updateTableView(nil)
            self?.getPokeImages()
        })
    }
    
    func numberOfPokemons() -> Int {
        return pokemonList.count
    }
    
    func getPokemon(index: Int) -> PokemonId {
        return pokemonList[index]
    }
    
    func getPokeImages() {
        Task {
            for index in 0..<pokemonList.count {
                pokemonList[index].pokemonImg = await interactor?.getPokemonImg(pokemonName: pokemonList[index].name)
                pokemonListCopy[index].pokemonImg = pokemonList[index].pokemonImg
                view?.updateTableView(index)
            }
            view?.setSpinner(show: false)
        }
    }
    
    func goToPokeDetail(index: Int) {
        Task {
            view?.setSpinner(show: true)
            let pokemonInfo = await interactor?.getPokemonInfo(pokemonName: pokemonList[index].name)
            DispatchQueue.main.async { [unowned self] in
                self.view?.setSpinner(show: false)
                Navigation.showPokemonDetail(pokeData: (self.pokemonList[index]), pokeInfo: pokemonInfo)
            }
        }
    }
    
    func searchPokemon(searchHint: String) {
        
        pokemonList = searchHint == "" ?  pokemonListCopy:pokemonListCopy.filter({$0.name.contains(searchHint.lowercased())})
        
        view?.updateTableView(nil)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
