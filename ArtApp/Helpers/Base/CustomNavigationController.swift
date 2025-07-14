//
//  CustomNavigationController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit

class CustomNavigationController: UINavigationController {
    override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
