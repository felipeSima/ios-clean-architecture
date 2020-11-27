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
    
    lazy var imageLogo: UIImageView = {
       let imageView  = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logoView")
        return imageView
    }()
    
    lazy var titleHeaderView: TitleHeaderView = {
       let label = TitleHeaderView()
        label.alignment = .center
        label.bottomItem = imageLogo
        label.titleLabel.textColor = .yellow
        label.subtitleLabel.textColor = .yellow
        imageLogo.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(10)
        }
        return label
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
