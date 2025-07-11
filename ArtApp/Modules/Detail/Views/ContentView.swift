//
//  DetailView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

class ContentView: BaseView {
    private let imageView = DetailImageView()
    private let bioView = DetailBio()
    let tableView = DetailTable()
    
    
    func configure(with artist: Artist) {
        imageView.configure(with: artist)
        bioView.configure(with: artist)
        tableView.artist = artist
    }
    
}

extension ContentView {
    override func setupViews() {
        addView(imageView)
        addView(bioView)
        addView(tableView)
        
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo:leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            
            bioView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            bioView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bioView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            bioView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            tableView.topAnchor.constraint(equalTo: bioView.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            tableView.heightAnchor.constraint(equalToConstant: 950)
            
        ])
    }
}



