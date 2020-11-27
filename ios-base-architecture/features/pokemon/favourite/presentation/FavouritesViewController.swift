//
//  FavouritesViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit
import Swinject
import SkeletonView

class FavouritesViewController: UIViewController {
    
    var container: Container!
    var favouriteView = PokemonListView()
    var viewModel: FavouritesViewModel
    
    init(container: Container) {
        self.container = container
        self.viewModel = FavouritesViewModel(usecase: container.resolve(GetPokemonList.self)!)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        layoutComponents()
        setDelegation()
        getData()
    }
    
    func setNavigationController(){
        navigationItem.titleView = AppearanceUtils.GetLogoImage()
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func layoutComponents(){
        self.view.addSubview(favouriteView)
        favouriteView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegation(){
        favouriteView.tableView.delegate = self
        favouriteView.tableView.dataSource = self
    }
    
    func getData() {
        DispatchQueue.main.async {
            self.favouriteView.tableView.showAnimatedSkeleton()
        }
    }
    
    func handleSuccess(_ pokemonList: [PokemonListEntity]){
        DispatchQueue.main.async {
            self.favouriteView.tableView.hideSkeleton()
            self.favouriteView.tableView.reloadData()
        }
    }
    
    func handleError(_ error: ServerError){
        DispatchQueue.main.async {
            self.favouriteView.tableView.hideSkeleton()
            self.favouriteView.tableView.reloadData()
        }
    }

}

extension FavouritesViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonListCell
        cell.set(serie: "No. \(indexPath.row)", pokemon: self.viewModel.pokemons[indexPath.row])
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "cell"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PokemonDetailViewController(pokemon: viewModel.pokemons[indexPath.row], container: container)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

