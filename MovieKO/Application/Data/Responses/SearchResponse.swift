//
//  SearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

struct SearchResponse: Decodable,MockableModel,Equatable {
    
    
    static var mock: Self{
        return SearchResponse()
    }
}
