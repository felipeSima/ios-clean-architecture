//
//  FavouriteView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import UIKit

class FavouriteView: UIView{

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        addComponents()
        layoutComponents()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addComponents(){
        self.addSubview(emptyView)
        self.addSubview(collectionView)
    }

    func layoutComponents(){
        emptyView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    lazy var emptyView: EmptyDataPlaceholderView = {
        let view = EmptyDataPlaceholderView()
        view.titleLabel.text = "Temos que pegar"
        view.subtitleLabel.text = "Sua lista de pokemons ainda está vazia."
        return view
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FavouriteCollectionViewCell.self, forCellWithReuseIdentifier: "favourite")
        collectionView.isSkeletonable = true
        return collectionView
    }()

}

