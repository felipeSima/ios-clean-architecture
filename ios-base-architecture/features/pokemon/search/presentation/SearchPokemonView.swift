//
//  SearchPokemonView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit

class SearchPokemonView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var searchController:UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Qual pokémon você está procurando ?"
        search.hidesNavigationBarDuringPresentation = false
        if #available(iOS 13.0, *) {
            search.searchBar.searchTextField.font = UIFont.defaultRegularFont(ofSize: 15)
            search.hidesNavigationBarDuringPresentation = true
        }
        search.obscuresBackgroundDuringPresentation = false
        return search
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        tableView.tableFooterView = UIView()
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

}
