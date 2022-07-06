//
//  CategoryModel.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/5/22.
//

import Foundation

struct CategoryModel: Codable {
    let genres: [Genres]
    enum CodingKeys: String, CodingKey {
        case genres
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
