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
    let title = UILabel()
    
    func configure(with work: Work) {
        artistImage.image = UIImage(named: work.image)
        title.text = work.title
    }
}

extension WorkCell {
    override func setupViews() {
        addSubview(artistImage)
        addSubview(title)
        
    }
    
    override func setConstraints() {
        artistImage.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(180)
        }
        title.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(artistImage.snp.bottom)
            make.height.equalTo(20)
        }
    }
}
