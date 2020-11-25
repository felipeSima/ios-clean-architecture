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

    var usecase: GetPokemonList?
    var pokemonView = PokemonListView()
    var pokemon = [Pokemon]()
    
    init(usecase: GetPokemonList) {
        super.init(nibName: nil, bundle: nil)
        self.usecase = usecase
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        layoutComponents()
        setDelegation()
        getData()
    }
    
    func setupController(){
        self.view.backgroundColor = .white
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
            self.usecase?.getPokemonList(completion: self.handleSuccess, failure: self.handleError)
        }
    }
    
    func handleSuccess(_ pokemonList: PokemonListEntity){
        DispatchQueue.main.async {
            self.pokemonView.tableView.hideSkeleton()
            self.pokemon.append(contentsOf: pokemonList.results)
            self.pokemonView.tableView.reloadData()
        }
        print(pokemonList)
    }
    
    func handleError(_ error: ServerError){
        DispatchQueue.main.async {
            self.pokemonView.tableView.hideSkeleton()
            self.pokemonView.tableView.reloadData()
        }
        print(error.errorMessage ?? "Unknown error")
    }

}

extension PokemonListViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonListCell
        cell.set(title: pokemon[indexPath.row].name, subTitle: "\(indexPath.row)")
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "cell"
    }
    
    
}

