//
//  HomeView.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: Bundle.main),forCellReuseIdentifier: "PokemonTableViewCell")
        searchBar.delegate = self
        spinnerView.hidesWhenStopped = true
        presenter?.viewDidLoad()
        onTaphideKeyboard()
        
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    
    func updateTableView(_ cell: Int?) {
        DispatchQueue.main.async { [weak self] in
            if let cell = cell {
                self?.pokemonTableView.reloadRows(at: [IndexPath(row: cell, section: 0)], with: .none)
            } else {
                self?.pokemonTableView.reloadData()
            }
        }
    }
    
    
    func setSpinner(show: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.searchBar.isUserInteractionEnabled = !show
            self?.pokemonTableView.isUserInteractionEnabled = !show
            self?.loadingLabel.isHidden = !show
            if show {
                self?.spinnerView.startAnimating()
                return
            }
            self?.spinnerView.stopAnimating()
        }
    }
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToPokeDetail(index: indexPath.row)
    }
    
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfPokemons() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let obj = presenter?.getPokemon(index: indexPath.row) else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell",for: indexPath) as! PokemonTableViewCell
        cell.initCell(pokemon: obj)
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension HomeView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        presenter?.searchPokemon(searchHint: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}
