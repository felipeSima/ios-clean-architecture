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

    var resolver: Resolver
    var viewModel: PokemonListViewModel
    var pokemonView = PokemonListView()

    init(resolver: Resolver) {
        self.resolver = resolver
        self.viewModel = PokemonListViewModel(usecase: resolver.resolve(GetPokemonList.self)!)
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
        getData(from: .remote)
    }

    func setNavigationController(){
        navigationItem.titleView = AppearanceUtils.GetLogoImage()
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = pokemonView.searchController
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
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
        pokemonView.searchController.delegate = self
        pokemonView.tableView.delegate = self
        pokemonView.tableView.dataSource = self
    }

    func getData(from datasource: DataOrigin) {
        DispatchQueue.main.async {
            self.pokemonView.tableView.showAnimatedSkeleton()
            self.viewModel.getPokemonList(from: datasource, onComplete: self.handleSuccess, onFailure: self.handleError)
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

extension PokemonListViewController: UISearchControllerDelegate, UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}

    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}

extension PokemonListViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemonsFiltered.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonListCell
        cell.set(serie: "No. \(self.viewModel.pokemonsFiltered[indexPath.row].pokemonId)", pokemon: self.viewModel.pokemonsFiltered[indexPath.row])
        cell.didPressedEditButton = {

        }
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "cell"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PokemonDetailViewController(id: viewModel.pokemonsFiltered[indexPath.row].pokemonId, resolver: resolver)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

