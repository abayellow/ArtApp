//
//  DetailViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit

class DetailViewController: BaseViewController, DetailTableDelegate {
    var detailView = ContentView()
    private let scrollView = UIScrollView()
    
    func didSelectWork(_ work: Work) {
        let imageVC = ImageViewController()
        imageVC.configure(with: work)
        navigationController?.pushViewController(imageVC, animated: true)
    }
    
 
}

extension DetailViewController {
    override func setupViews() {
        detailView.tableView.tableDelegate = self
        navigationController?.setTransparentNavigationBar()
        setupBackButton()
        configureScrollView()
        
        view.addView(scrollView)
        scrollView.addView(detailView)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2.1),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
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
    
    func configureScrollView() {
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
    }
}

extension DetailViewController: UIScrollViewDelegate  {
    /// hide back button when scroll scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let backButton = navigationItem.leftBarButtonItem?.customView else { return }
        backButton.isHidden = scrollView.contentOffset.y > 50
        
        let offsetY = scrollView.contentOffset.y
        isStatusBarHidden = offsetY > 50
    }
}


