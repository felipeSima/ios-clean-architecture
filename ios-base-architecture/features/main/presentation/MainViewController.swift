//
//  MainViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit
import Swinject

class MainViewController: UITabBarController {

    var resolver: Resolver

    init(resolver: Resolver){
        self.resolver = resolver
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let listViewController = UINavigationController(rootViewController: PokemonListViewController(resolver: resolver))
        listViewController.tabBarItem = UITabBarItem(title: "Lista", image: UIImage(named: "outline_list_black_24pt_1x"), tag: 0)

        let favouriteViewController = UINavigationController(rootViewController: FavouritesViewController(resolver: resolver))
        favouriteViewController.tabBarItem = UITabBarItem(title: "Busca", image: UIImage(named: "outline_system_update_black_24pt_1x"), tag: 1)

        self.viewControllers = [listViewController,favouriteViewController]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {}
    }

}
