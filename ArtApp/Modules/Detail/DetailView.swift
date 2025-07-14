//
//  DetailView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit
import SnapKit

class DetailView: BaseView {
     let collection = DetailCollectionView()

    func configure(with artist: Artist) {
        collection.artist = artist
    }
    
}
extension DetailView {
    override func setupViews() {
      addSubview(collection)
    }
    override func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



