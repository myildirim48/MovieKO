//
//  MovieSearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

// MARK: - MultiSearchResponse
struct MovieSearchResponse: Decodable, MockableModel, Equatable {
    
    let page: Int?
    let results: [MovieSearchResults]
    let totalPages : Int?
    let totalResults: Int?
    
    
    static var mock:Self {
        return MovieSearchResponse(page: 1, results: [MovieSearchResults.mock], totalPages: 4, totalResults: 10)
    }
    
}



