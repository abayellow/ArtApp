//
//  ViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

final class MainViewController: BaseViewController {
    private var mainView = MainView()
    private var viewModel = MainViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setDefaultNavigationBar()
    }
}

extension MainViewController {
    override func setupViews() {
        mainView.collectionView.mainCollectionDelegate = self
        viewModel.loadArtists()
        bindCollection()
        setupNavController()
        setupSearchController()
        
    }
    func setupNavController() {
        title = "Artists"
        navigationController?.setDefaultNavigationBar()
    }
    func setupSearchController() {
        navigationItem.searchController = mainView.searchController
        mainView.searchController.searchResultsUpdater = self
    }
    
    func bindCollection() {
        viewModel.onDataUpdate = { [weak self] in
            self?.mainView.collectionView.configure(with: self?.viewModel.searchResult ?? [])
            self?.mainView.collectionView.reloadData()
        }
    }
}



extension MainViewController: MainCollectionDelegate {
    func didSelect(artist: Artist) {
        let detailViewController = DetailViewController(artist: artist)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        viewModel.filterArtists(by: searchText)
    }
}
