//
//  DetailTable.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 11.07.25.
//

import UIKit

protocol DetailTableDelegate: AnyObject {
    func didSelectWork(_ work: Work)
}

class DetailTable: BaseTableView {

    var artist: Artist?
    weak var tableDelegate: DetailTableDelegate?
}

extension DetailTable: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell else {
            return UITableViewCell()
        }
        if let localArtist = artist {
            cell.configure(with: localArtist, indexPath: indexPath)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 0.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let work = artist?.works[indexPath.row] else {return}
        tableDelegate?.didSelectWork(work)
    }

}

extension DetailTable {
    override func setupViews() {
        register(DetailCell.self, forCellReuseIdentifier: "cell")
        dataSource = self
        delegate = self
        separatorStyle = .none
//        backgroundColor = .green
        isScrollEnabled = false
    }
}
