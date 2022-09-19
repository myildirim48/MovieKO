//
//  MultiSearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

    // MARK: - MultSearch
struct MultiSearchResponse: Codable,MockableModel {

    let page: Int
    let results: [MultiSearchResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    static var mock:Self {
        return MultiSearchResponse(page: 1, results: [MultiSearchResult.mock], totalPages: 1, totalResults: 1)
    }
    
}


   
