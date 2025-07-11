//
//  File.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//


import UIKit

class BaseTableCell: UITableViewCell {
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension BaseTableCell {
    func setupViews() {
        
    }
    func setConstraints() {}
}
