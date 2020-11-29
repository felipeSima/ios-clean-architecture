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
        
        self.isSkeletonable = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.kf.indicatorType = .activity
        imageView.isSkeletonable = true
        return imageView
    }()
    
}
