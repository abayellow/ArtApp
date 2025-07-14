//
//  BaseCollectionView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    init() {
         let flowLayout = UICollectionViewFlowLayout()
//         flowLayout.scrollDirection = .vertical
//         flowLayout.minimumLineSpacing = 10
//         flowLayout.minimumInteritemSpacing = 10
//         flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
         
         super.init(frame: .zero, collectionViewLayout: flowLayout)
         setupViews()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
}

@objc extension BaseCollectionView {
    func setupViews() {}
}


