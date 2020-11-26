//
//  UIButtonExtension.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit

extension UIButton{

    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }

}
