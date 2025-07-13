//
//  ViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

final class MainViewController: BaseViewController {
    private lazy var collectionView = UICollectionView()
    private var searchController = UISearchController(searchResultsController: nil)
    private let networkManager = NetworkService()
    private var artists: [Artist] = []
    private var searchResult: [Artist] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArtists()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setDefaultNavigationBar()
    }

    private func loadArtists() {
        networkManager.request(urlString: API.stringURL) { result in
            switch result {
            case .success(let artists):
                self.artists = artists.artists
                self.searchResult = artists.artists
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MainViewController {
    override func setupViews() {
        title = "Artists"
        navigationController?.setDefaultNavigationBar()

        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        let flowLayout = FlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.reqister(MainCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            searchResult = artists
                .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            collectionView.reloadData()
        } else {
            searchResult = artists
            collectionView.reloadData()
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchResult.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(of: MainCell.self, indexPath: indexPath)
        cell.configure(artist: searchResult[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.detailView.configure(with: searchResult[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
