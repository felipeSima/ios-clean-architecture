//
//  PokemonDetailView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit

class PokemonDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        addComponents()
        layoutComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewBackground.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 60)
    }
    
    func set(_ pokemon: PokemonListEntity){
        self.pokemonTitle.text = pokemon.name.capitalizingFirstLetter()
        self.pokemonImage.kf.cancelDownloadTask()
        self.pokemonImage.image = nil
        if !pokemon.imageUrl.isEmpty {
            DispatchQueue.main.async {
                self.pokemonImage.kf.setImage(with: URL(string: pokemon.imageUrl), options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1))
                ])
            }
        }
    }
    
    func addComponents(){
        self.addSubview(viewBackground)
        self.addSubview(pokemonImage)
        self.pokemonImage.addSubview(pokemonTitle)
    }
    
    func layoutComponents(){
        viewBackground.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        pokemonImage.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            //make.top.equalToSuperview().inset(80)
        }
        pokemonTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self.pokemonImage.snp.bottom).inset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(100)
        }
    }
    
    lazy var viewBackground: UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.kf.indicatorType = .activity
        imageView.isSkeletonable = true
        return imageView
    }()
    
    lazy var pokemonTitle: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.extraLarge, fontType: .bold)
        label.backgroundColor = .systemPink
        label.textAlignment = .center
        label.isSkeletonable = true
        return label
    }()
    
}
