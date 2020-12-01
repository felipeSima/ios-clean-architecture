//
//  PokemonDetailViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import UIKit
import Swinject
import WebKit

class PokemonDetailViewController: UIViewController {

    let pokemonId: Int
    let detailView = PokemonDetailView()
    var resolver: Resolver

    init(id: Int, resolver: Resolver){
        self.resolver = resolver
        self.pokemonId = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        constrainView()
        setupWebView()
    }

    func setNavigationController(){
        navigationItem.titleView = AppearanceUtils.GetLogoImage()
        navigationItem.hidesSearchBarWhenScrolling = true
        self.view.backgroundColor = .white
    }

    func constrainView(){
        self.view.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    func setupWebView(){
        let url = URL(string: "https://pokedex.org/#/pokemon/\(pokemonId)")
        let myRequest = URLRequest(url: url!)
        detailView.webView.load(myRequest)
    }
}

extension PokemonDetailViewController: WKUIDelegate {}
