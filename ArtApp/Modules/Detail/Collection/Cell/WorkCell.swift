//
//  WorkCell.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit
import SnapKit

class WorkCell: BaseCollectionCell {
    let artistImage = UIImageView()
    let workName = UILabel()
    
    func configure(with work: Work) {
        artistImage.image = UIImage(named: work.image)
        workName.text = work.title
    }
}

extension WorkCell {
    override func setupViews() {
        addSubview(artistImage)
        addSubview(workName)
        configureImage()
        configureWorkNameLabel()
    }
    
    override func setConstraints() {
        artistImage.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(165)
        }
        workName.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(artistImage.snp.bottom).offset(10)
            make.height.equalTo(15)
        }
    }
    
    func configureImage() {
        artistImage.layer.cornerRadius = 12
        artistImage.clipsToBounds = true
    }
    
    func configureWorkNameLabel() {
        workName.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 18)
    }
}
