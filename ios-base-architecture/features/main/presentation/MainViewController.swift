//
//  MainViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit
import Swinject

class MainViewController: UITabBarController {

    var container: Container?
    
    init(container: Container){
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let container = container else {return}
        
        let listViewController = UINavigationController(rootViewController: PokemonListViewController(container: container))
        //listViewController.navigationBar.barStyle = .black
        listViewController.tabBarItem = UITabBarItem(title: "Lista", image: UIImage(named: "outline_list_black_24pt_1x"), tag: 0)
        
        let searchViewController = UINavigationController(rootViewController: FavouritesViewController(container: container))
        //searchViewController.navigationBar.barStyle = .black
        searchViewController.tabBarItem = UITabBarItem(title: "Busca", image: UIImage(named: "outline_system_update_black_24pt_1x"), tag: 1)
        
        let savedViewController = UINavigationController(rootViewController: SearchPokemonViewController(container: container))
        //savedViewController.navigationBar.barStyle = .black
        savedViewController.tabBarItem = UITabBarItem(title: "Salvos", image: UIImage(named: "outline_find_in_page_black_24pt_1x"), tag: 2)
        
        
        self.viewControllers = [listViewController,searchViewController, savedViewController]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {}
    }

}
