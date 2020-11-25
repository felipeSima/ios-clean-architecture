//
//  PokemonListView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit

class PokemonListView: UIView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleHeaderView: TitleHeaderView = {
       let label = TitleHeaderView()
        label.alignment = .center
        label.title = NSLocalizedString("pokemon_list_title", comment: "")
        label.subtitle = "by Afya"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.tableFooterView = UIView()
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = titleHeaderView
        titleHeaderView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        return tableView
    }()
    
}
