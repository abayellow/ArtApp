//
//  DetailViewController.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {
    var detailView = ContentView()
 
 
}

extension DetailViewController {
    override func setupViews() {
        modalPresentationCapturesStatusBarAppearance = true
        navigationController?.setTransparentNavigationBar()
        setupBackButton()
        detailView.collection.detailDelegate = self
//        detailView.collection.delegate = self
        view.addSubview(detailView)
    }

    override func setupConstraints() {
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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




