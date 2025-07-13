//
//  UInavigationController + Ext.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

extension UINavigationController {
    func setTransparentNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.tintColor = .white
        
        
    }
    
    func setDefaultNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.tintColor = .white
        self.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
