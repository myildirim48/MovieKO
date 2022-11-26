//
//  DiscoverResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 24.11.2022.
//

import Foundation
struct DiscoverResponse: Codable, MockableModel, Equatable {
    
    let page: Int?
    let results: [DiscoverResult] 
    let totalPages : Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
           case page, results
           case totalPages
           case totalResults
       }
    
    static var mock:Self {
        return DiscoverResponse(page: 1, results: [DiscoverResult.mock], totalPages: 5, totalResults: 10)
    }
    
}
