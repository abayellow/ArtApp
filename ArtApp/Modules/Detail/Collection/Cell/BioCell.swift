//
//  BioCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
import SnapKit

class BioCell: BaseCollectionCell {
    let title = UILabel()
    let biography = UILabel()
    
    func configure(with artist: Artist) {
        title.text = "Biography"
        biography.text = artist.bio
    }
}

extension BioCell {
    override func setupViews() {
        addSubview(title)
        addSubview(biography)
    }
    
    override func setConstraints() {
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(15)
        }
        
        biography.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(title.snp.bottom).inset(5)
        }
    }
}

