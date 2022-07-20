//
//  SimilarMoviesModel.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 16/07/22.
//

import Foundation

struct SimilarMoviesModel: Decodable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
