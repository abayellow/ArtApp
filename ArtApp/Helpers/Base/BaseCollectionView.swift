//
//  BaseCollectionView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension BaseCollectionView {
    func setupViews() {}
}


