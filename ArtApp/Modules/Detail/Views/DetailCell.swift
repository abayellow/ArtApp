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
    
}

extension DetailCell {
    override func setupViews() {
        [image, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        backgroundColor = .systemYellow
        
        image.backgroundColor = .yellow
        label.text = "label text"
//        label.backgroundColor = .orange
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
