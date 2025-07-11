//
//  BaseView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

@objc extension BaseView {

    func setupViews() {}
    func setupConstraints() {}
    
}
