//
//  NetworkService.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import Foundation

class NetworkService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func request(urlString: String, completion: @escaping (Result<Artists, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            
            guard let data else {
                completion(.failure(NetworkError.dataNotDecoded))
                return
            }
            
            do {
                let artists = try JSONDecoder().decode(Artists.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(artists))
                }
                
            } catch {
                completion(.failure(NetworkError.dataNotDecoded))
            }
            
        }.resume()
        
    }
}
