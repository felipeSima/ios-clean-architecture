//
//  UIImageExtension.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit

extension UIImage {
    
    func scaledTo(size: CGSize) -> UIImage? {
        let horizontalRatio = size.width / self.size.width
        let verticalRatio = size.height / self.size.height

        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
