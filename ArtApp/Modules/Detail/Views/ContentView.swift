//
//  DetailView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

class DetailView: UIView {
    
    private let imageView = UIImageView()
    private let bioView = UIView()
    private let tableView = DetailTable()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with artist: Artist) {
        imageView.image = UIImage(named: artist.image)
    }
    
}

extension DetailView {
    func setupViews() {
        [imageView, bioView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
          addSubview($0)
        }
        setupTable()
        
        bioView.backgroundColor = .red
    }

    func setupTable() {
        tableView.register(DetailCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .green
        tableView.isScrollEnabled = false
    }
    

    func setupConstraints() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo:leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            
            bioView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            bioView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bioView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            bioView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            tableView.topAnchor.constraint(equalTo: bioView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            tableView.heightAnchor.constraint(equalToConstant: 800)
 
        ])
    }
}



