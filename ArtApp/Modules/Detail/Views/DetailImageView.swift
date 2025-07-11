//
//  DetailImageView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class DetailImageView: BaseView {
    let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let autorLabel = UILabel()
    
    func configure(with artist: Artist) {
        imageView.image = UIImage(named: artist.image)
        nameLabel.text = artist.name
    }
    
}

extension DetailImageView {
    override func setupViews() {
        addView(imageView)
        addView(nameLabel)
        addView(autorLabel)
        autorLabel.text = "Author"
        
        nameLabel.textColor = .white
        autorLabel.textColor = .white
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            autorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            autorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
    }
}
