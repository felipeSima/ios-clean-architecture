//
//  PokemonListViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import UIKit
import Swinject

class PokemonListViewController: UIViewController {

    var usecase: GetPokemonList?
    
    init(usecase: GetPokemonList) {
        super.init(nibName: nil, bundle: nil)
        self.usecase = usecase
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        usecase?.getPokemonList(completion: handleSuccess, failure: handleError)
    }
    
    func handleSuccess(_ pokemonList: PokemonListEntity){
        print(pokemonList)
    }
    
    func handleError(_ error: ServerError){
        print(error.errorMessage ?? "Unknown error")
    }

}
