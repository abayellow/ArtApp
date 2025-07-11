//
//  DetailBio.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class DetailBio: BaseView {
    private let titleLabel = UILabel()
    private let bioLabel =  UILabel()
    private let worksLabel = UILabel()
    
    func configure(with artist: Artist) {
        bioLabel.text = artist.bio
    }
    
}

extension DetailBio {
    override func setupViews() {
        configureTitle()
        congigureBio()
        configureWorks()
        
        addView(titleLabel)
        addView(bioLabel)
        addView(worksLabel)
        addView(worksLabel)
    }
    
    func configureTitle() {
        titleLabel.text = "Biography"
        titleLabel.font = UIFont(name: "AvenirNext-DemiBoldItalic" , size: 17)
    }
    func congigureBio() {
        bioLabel.numberOfLines = 0
        bioLabel.adjustsFontSizeToFitWidth = true
        bioLabel.lineBreakMode = .byTruncatingTail
        bioLabel.font = UIFont(name: "AvenirNext-Regular", size: 15)
    }
    
    func configureWorks() {
        worksLabel.text = "Works"
        worksLabel.font = UIFont(name: "AvenirNext-DemiBoldItalic" , size: 17)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      
            bioLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            bioLabel.bottomAnchor.constraint(equalTo: worksLabel.topAnchor, constant: -20),
            
            worksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            worksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            worksLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

