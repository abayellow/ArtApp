//
//  ImageButton.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class ImageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        setTitle("Expand", for: .normal)
//        backgroundColor = .purple
//        layer.cornerRadius = 12
    }
    
   
}
