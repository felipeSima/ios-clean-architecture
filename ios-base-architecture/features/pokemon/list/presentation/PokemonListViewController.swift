//
//  PokemonListViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/23/20.
//

import UIKit
import Swinject
import SkeletonView

class PokemonListViewController: UIViewController {

    var container: Container
    var viewModel: PokemonListViewModel
    var pokemonView = PokemonListView()
    
    init(container: Container) {
        self.container = container
        self.viewModel = PokemonListViewModel(usecase: container.resolve(GetPokemonList.self)!)
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
        self.view.addSubview(pokemonView)
        pokemonView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegation(){
        pokemonView.tableView.delegate = self
        pokemonView.tableView.dataSource = self
    }
    
    func getData() {
        DispatchQueue.main.async {
            self.pokemonView.tableView.showAnimatedSkeleton()
            self.viewModel.getPokemonList(onComplete: self.handleSuccess, onFailure: self.handleError)
        }
    }
    
    func handleSuccess(_ pokemonList: [PokemonListEntity]){
        DispatchQueue.main.async {
            self.pokemonView.tableView.hideSkeleton()
            self.pokemonView.tableView.reloadData()
        }
    }
    
    func handleError(_ error: ServerError){
        DispatchQueue.main.async {
            self.pokemonView.tableView.hideSkeleton()
            self.pokemonView.tableView.reloadData()
        }
    }

}

extension PokemonListViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate{
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

