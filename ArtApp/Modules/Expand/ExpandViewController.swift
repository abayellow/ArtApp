//
//  ExpandViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class ExpandViewController: BaseViewController {
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    
    
    func configure(with work: Work) {
        imageView.image = UIImage(named: work.image)
   
    }
}

extension ExpandViewController: UIScrollViewDelegate {
    override func setupViews() {
        view.backgroundColor = .black
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.clipsToBounds = true

        view.addView(scrollView)
        scrollView.addView(imageView)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
}
