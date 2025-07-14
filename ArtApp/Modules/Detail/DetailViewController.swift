//
//  DetailViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {
    var detailView = DetailView()
    
    private var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailView
    }
}

extension DetailViewController {
    override func setupViews() {
        setupDetailView()
        setupBackButton()
        setupNavigation()
    }

    func setupDetailView() {
        detailView.configure(with: artist)
        detailView.collection.detailDelegate = self
    }
    func setupNavigation() {
        modalPresentationCapturesStatusBarAppearance = true
        navigationController?.setTransparentNavigationBar()
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
}

extension DetailViewController: DetailCollectionDelegate {
    func didScroll(_ scrollView: UIScrollView) {
        guard let backButton = navigationItem.leftBarButtonItem?.customView else { return }
        backButton.isHidden = scrollView.contentOffset.y > 50
        let offsetY = scrollView.contentOffset.y
        isStatusBarHidden = offsetY > 50
    }
    
    func didSelected(work: Work) {
        let imageViewContrller = ImageViewController()
        imageViewContrller.configure(with: work)
        navigationController?.pushViewController(imageViewContrller, animated: true)
    }
}




