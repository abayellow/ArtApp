//
//  Artist.swift
//  ArtApp
//
//  Created by Alexander Abanshin on 10.07.25.
//

import Foundation

struct Artists: Decodable {
    var artists: [Artist]
}

struct Artist: Decodable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Decodable {
    let title: String
    let image: String
    let info: String
}
