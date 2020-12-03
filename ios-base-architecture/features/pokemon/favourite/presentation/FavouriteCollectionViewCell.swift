//
//  FavouriteCollectionViewCell.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import UIKit
import Kingfisher

class FavouriteCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
        self.isSkeletonable = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutView() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        self.layer.cornerRadius = 15
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }

    func set(pokemon: PokemonEntity){
        pokemonName.text = pokemon.name.capitalizingFirstLetter()
        pokeballIcon.image = UIImage(named: "saved")
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

    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.kf.indicatorType = .activity
        imageView.isSkeletonable = true
        return imageView
    }()

    lazy var pokeballIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.kf.indicatorType = .activity
        imageView.isSkeletonable = true
        return imageView
    }()

    lazy var pokemonName: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.small, fontType: .light)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pokemonImage, pokemonName, pokeballIcon])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10

        pokemonImage.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.size.equalTo(200)
        }

        pokemonName.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(40)
        }

        pokeballIcon.snp.makeConstraints { make in
            make.size.equalTo(30)
        }

        return stackView
    }()

}
