//
//  FavouritesViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit
import Swinject

class FavouritesViewController: UIViewController {
    
    var container: Container!
    
    init(container: Container) {
        super.init(nibName: nil, bundle: nil)
        self.container = container
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }

}
