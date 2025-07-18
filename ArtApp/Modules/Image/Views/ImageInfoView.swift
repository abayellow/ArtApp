//
//  ImageInfoView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class ImageInfoView: BaseView {
    private let titleLabel = UILabel()
    private let infoLabel = UILabel()
    
    func configure(with work: Work) {
        titleLabel.text = work.title
        infoLabel.text = work.info

    }
}

extension ImageInfoView {
    override func setupViews() {
        backgroundColor = .white
        addView(titleLabel)
        addView(infoLabel)
        
        
        configureTitle()
        configureInfo()
    }
    
    func configureTitle() {
        titleLabel.text = "Biography"
        titleLabel.font = UIFont(name: "AvenirNext-DemiBoldItalic" , size: 17)
        titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func configureInfo() {
        infoLabel.numberOfLines = 0
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.lineBreakMode = .byTruncatingTail
        infoLabel.textAlignment = .left
        infoLabel.font = UIFont(name: "AvenirNext-Regular", size: 15)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
}
