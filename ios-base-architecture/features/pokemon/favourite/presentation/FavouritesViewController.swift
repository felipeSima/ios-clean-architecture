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
    var favouriteView = FavouriteView()
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
        favouriteView.collectionView.delegate = self
        favouriteView.collectionView.dataSource = self
    }

    func getData(){
        viewModel.getFavouritedPokemons { _ in
            self.favouriteView.collectionView.reloadData()
        } onFailure: { serverError in
            print(serverError)
            self.favouriteView.collectionView.reloadData()
        }

    }

}

extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        setupFavouritesView()
        return viewModel.pokemons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return favouriteCell(for: collectionView, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = PokemonDetailViewController(id: viewModel.pokemons[indexPath.row].pokemonId, container: container)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func favouriteCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> FavouriteCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favourite", for: indexPath) as! FavouriteCollectionViewCell
        cell.set(pokemon: viewModel.pokemons[indexPath.row])
        return cell
    }

    // MARK: CollectionView FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = self.favouriteView.collectionView.frame.size.width - 60
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,left: 20,bottom: 10,right: 20
)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func setupFavouritesView(){
        let hidePlaceholder = viewModel.pokemons.count > 0
        favouriteView.emptyView.isHidden = hidePlaceholder
        favouriteView.layoutIfNeeded()
    }
}

