//
//  Error.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case dataNotDecoded
}
