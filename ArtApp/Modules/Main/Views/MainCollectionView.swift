//
//  MainCollectionView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
protocol MainCollectionDelegate: AnyObject {
    func didSelect(artist: Artist)
}

class MainCollectionView: BaseCollectionView {
    weak var mainCollectionDelegate: MainCollectionDelegate?
    var artists: [Artist] = []
    
    
    func configure(with artists: [Artist] ) {
        self.artists = artists
    }
}

extension MainCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueCell(of: MainCell.self, indexPath: indexPath)
        cell.configure(artist: artists[indexPath.row])
        return cell
    }
    
    
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideInset: CGFloat = 16
        let cellHeight: CGFloat = 120
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - (sideInset * 2)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let artist = artists[indexPath.row]
        mainCollectionDelegate?.didSelect(artist: artist)
    }
}


extension MainCollectionView {
    override func setupViews() {
        delegate = self
        dataSource = self
        reqister(MainCell.self)
    }
}
