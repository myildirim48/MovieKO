//
//  MovieSearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

// MARK: - MultiSearchResponse
struct MultiSearchResponse: Codable, MockableModel, Equatable {
    
    let page: Int?
    let results: [MultiSearchResult]  // TVSearchResult, PersonSearchReult
    let totalPages : Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
           case page, results
           case totalPages
           case totalResults
       }
    
    static var mock:Self {
        return MultiSearchResponse(page: 1, results: [MultiSearchResult.mock], totalPages: 5, totalResults: 10)
    }
    
}



