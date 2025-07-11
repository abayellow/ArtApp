//
//  BaseViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

class BaseViewController: UIViewController {
     var isStatusBarHidden = false {
          didSet {
              // Обновляем статус-бар с анимацией
              UIView.animate(withDuration: 0.25) {
                  self.setNeedsStatusBarAppearanceUpdate()
              }
          }
      }
    
    override var childForStatusBarStyle: UIViewController? {
        return self
    }

    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
//        setupApperance()
    }
    
   
}

@objc extension BaseViewController {
    func setupViews() {}
    func setupConstraints() {}
    func setupApperance() {
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
    }
    
    
  
}
