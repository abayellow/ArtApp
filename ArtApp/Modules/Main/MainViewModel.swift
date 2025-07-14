//
//  MainViewModel.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 14.07.25.
//

import Foundation

class MainViewModel {
    private let network = NetworkService()
    private(set) var artists: [Artist] = []
    private(set) var searchResult: [Artist] = []
    
    
    var onDataUpdate: (() -> ())?
    
    func loadArtists() {
        network.request(urlString: API.stringURL) { result in
            switch result {
            case .success(let artists):
                self.artists = artists.artists
                self.searchResult = artists.artists
                self.onDataUpdate?()
            case .failure(let error):
                print("Some error occur: \(error.localizedDescription)")
            }
            
        }
    }
    
    func filterArtists(by searchText: String) {
        if searchText.isEmpty {
            searchResult = artists
        } else {
            searchResult = artists.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        onDataUpdate?()
    }
    
}
