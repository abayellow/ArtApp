//
//  MainCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

final class MainCell: BaseCollectionCell {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    func configure(artist: Artist) {
        imageView.image = UIImage(named: artist.image)
        nameLabel.text = artist.name
        bioLabel.text = artist.bio
    }
}

extension MainCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        layer.cornerRadius = 10
        [imageView, nameLabel, bioLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        nameLabel.font = .systemFont(ofSize: 13, weight: .ultraLight)
        bioLabel.font = .systemFont(ofSize: 15, weight: .regular)
        bioLabel.numberOfLines = 2
    }
    override func setConstraints() {
        super.setConstraints()
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
