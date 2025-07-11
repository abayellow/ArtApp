//
//  ImageViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

class ImageViewController: BaseViewController {
    private let imageView = UIImageView()
    private let infoView = ImageInfoView()
    private let button = ImageButton(type: .system)
    private var work: Work?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configure(with work: Work) {
        imageView.image = UIImage(named: work.image)
        infoView.configure(with: work)
        
        self.work = work
    }
    @objc func didTapButton() {
        guard let work else { return }
        let expandViewController = ExpandViewController()
        expandViewController.configure(with: work)
        
        navigationController?.pushViewController(expandViewController, animated: true)
    }
}

extension ImageViewController {
    override func setupViews() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setupBackButton()
        view.addView(imageView)
        view.addView(infoView)
        view.addView(button)
    
        
       
       
    }
    
    func setupBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    @objc private func backTapped() {
           navigationController?.popViewController(animated: true)
       }
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            infoView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -5),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            button.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
}

