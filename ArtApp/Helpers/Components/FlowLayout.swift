//
//  CustomFlowLayout.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FlowLayout {
    func setupLayout() {
        let sideInset: CGFloat = 16
        let interItemSpacing: CGFloat = 12
        let cellHeight: CGFloat = 100
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - (sideInset * 2)
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: interItemSpacing, left: sideInset, bottom: interItemSpacing, right: sideInset)
        minimumLineSpacing = interItemSpacing
        minimumInteritemSpacing = 0
        scrollDirection = .vertical
    }
}
