//
//  PokemonDetailViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import UIKit
import Swinject

class PokemonDetailViewController: UIViewController {

    var viewModel: PokemonDetailViewModel
    let pokemonDetailView = PokemonDetailView()
    
    init(pokemon: PokemonListEntity, container: Container){
        self.viewModel = PokemonDetailViewModel(pokemon: pokemon, usecase: container.resolve(GetPokemonDetail.self)!)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        layoutView()
        getData()
    }
    
    func setNavigationController(){
        navigationItem.titleView = AppearanceUtils.GetLogoImage()
        navigationItem.hidesSearchBarWhenScrolling = true
        self.view.backgroundColor = .white
    }
    
    func layoutView(){
        self.view.addSubview(pokemonDetailView)
        pokemonDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func getData(){
        //pokemonDetailView.set(viewModel.pokemon)
        
        DispatchQueue.main.async {
            self.viewModel.getPokemonDetail(self.handleSuccess, self.handleFailure)
        }
 
    }
    
    func handleSuccess(_ pokemon: PokemonListEntity){
        pokemonDetailView.set(pokemon)
    }
    
    func handleFailure(_ failure: ServerError){
        print("DEU RUIM PARCEIRO")
    }

}
