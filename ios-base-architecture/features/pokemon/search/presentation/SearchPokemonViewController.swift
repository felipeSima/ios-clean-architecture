//
//  SearchPokemonViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import UIKit
import Swinject
import SkeletonView

class SearchPokemonViewController: UIViewController {

    var container: Container
    var searchView = SearchPokemonView()
    var viewModel: SearchViewModel
    
    init(container: Container) {
        self.container = container
        self.viewModel = SearchViewModel(usecase: container.resolve(GetPokemonDetail.self)!)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setDelegation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchView.searchController.isActive = true
        DispatchQueue.main.async {
            self.searchView.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func setNavigationController(){
        self.definesPresentationContext = true
        navigationItem.titleView = AppearanceUtils.GetLogoImage()
        navigationItem.searchController = searchView.searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        self.view.backgroundColor = .white
    }
    
    func setDelegation(){
        searchView.searchController.delegate = self
    }
    
    func layotView(){
        self.view.addSubview(searchView)
        searchView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

}

extension SearchPokemonViewController: UISearchControllerDelegate, UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //viewModel.requestSuggestion(searchText.count,searchText)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        viewModel.getPokemon(from: searchText, onComplete: handleSuccess, onFailure: handleFailure)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //dropDown.hide()
    }

    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func handleSuccess(_ pokemonListEntity: PokemonListEntity){
        
    }
    
    func handleFailure(_ error: ServerError){}
}
