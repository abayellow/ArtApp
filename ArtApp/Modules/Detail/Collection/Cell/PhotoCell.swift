//
//  PhotoCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
import SnapKit

class PhotoCell: BaseCollectionCell {
    private let artistImageView = UIImageView()
    private let nameLabel = UILabel()
    private let authorLabel = UILabel()
    
    func configure(with artist: Artist) {
        self.artistImageView.image = UIImage(named: artist.image)
        self.nameLabel.text = artist.name
        self.authorLabel.text = "Author"
    }
    
}

extension PhotoCell {
    override func setupViews() {
        addSubview(artistImageView)
        addSubview(nameLabel)
        addSubview(authorLabel)
        
    }
    
    override func setConstraints() {

        artistImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
}
