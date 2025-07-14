//
//  BioCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
import SnapKit

class BioCell: BaseCollectionCell {
    let titleLabel = UILabel()
    let biographyLabel = UILabel()
    
    func configure(with artist: Artist) {
        titleLabel.text = "Biography"
        biographyLabel.text = artist.bio
    }
}

extension BioCell {
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(biographyLabel)
        titleLabelSetup()
        bioLabelSetup()
    }
    
    override func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(15)
        }
        
        biographyLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    func titleLabelSetup() {
        titleLabel.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 18)
        
    }
    func bioLabelSetup() {
        biographyLabel.font = UIFont(name: "TimesNewRomanPS-ItalicMT", size: 16)
        biographyLabel.numberOfLines = 0
        biographyLabel.adjustsFontSizeToFitWidth = true
        biographyLabel.lineBreakMode = .byTruncatingTail
        
    }
}

