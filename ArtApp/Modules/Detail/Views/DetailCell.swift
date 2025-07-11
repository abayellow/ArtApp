//
//  DetailCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class DetailCell: BaseTableCell {
    private let image = UIImageView()
    private let label = UILabel()
    
    func configure(with artist: Artist, indexPath: IndexPath) {
        let imageName = artist.works[indexPath.row].image
        let imageTitle = artist.works[indexPath.row].title
        
        image.image = UIImage(named: imageName)
        label.text = imageTitle
    }
}

extension DetailCell {
    override func setupViews() {
        contentView.addView(image)
        contentView.addView(label)
        
        configureImage()
        configureLabel()
    }
    
    func configureImage() {
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
    }
    
    func configureLabel() {
        label.font = UIFont(name: "AvenirNext-Italic" , size: 18)
    }
    
    override func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
