//
//  DetailView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    private(set) lazy var searchController = UISearchController(searchResultsController: nil)
    private(set) lazy var collectionView = MainCollectionView()
    
}

extension MainView {
    override func setupViews() {
        addView(collectionView)
        
    }
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
