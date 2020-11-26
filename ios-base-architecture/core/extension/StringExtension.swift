//
//  StringExtension.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/25/20.
//

import Foundation

extension String {
    
    @discardableResult
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
