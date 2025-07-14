//
//  DetailCollectionView.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import UIKit

protocol DetailCollectionDelegate: AnyObject {
    func didSelected(work: Work)
    func didScroll(_ scrollView: UIScrollView)
}

class DetailCollectionView: BaseCollectionView {
    var artist: Artist!
    var detailDelegate: DetailCollectionDelegate!
}

extension DetailCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        default:
            return artist.works.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueCell(of: PhotoCell.self, indexPath: indexPath)
            cell.configure(with: artist)
            return cell
        case 1:
            let cell = collectionView.dequeueCell(of: BioCell.self, indexPath: indexPath)
            cell.configure(with: artist)
            return cell
        default:
            let cell = collectionView.dequeueCell(of: WorkCell.self, indexPath: indexPath)
            cell.configure(with: artist.works[indexPath.row])
            return cell
        }
    }
}
extension DetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let work = artist.works[indexPath.row]
        detailDelegate.didSelected(work: work)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        
        switch indexPath.section {
        case 0:
            
            return CGSize(width: width, height: width)
        case 1:
            
            return CGSize(width: width, height: 150)
        default:
            return CGSize(width: width - 25, height: 200)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        detailDelegate.didScroll(scrollView)
    }
}

extension DetailCollectionView {
    override func setupViews() {
        contentInsetAdjustmentBehavior = .never // к верхнему краю
        reqister(PhotoCell.self)
        reqister(BioCell.self)
        reqister(WorkCell.self)
        dataSource = self
        delegate = self
    }
}
