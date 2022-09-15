//
//  MovieStore.swift
//  MovieKO
//
//  Created by YILDIRIM on 14.09.2022.
//

import Foundation
class MovieStore: MovieService {
    
    static let shared = MovieService()
    private init() {}
    
    private let apiKey = "49671eff0295b9410c95cbf7aabbef4"
    private let baseAPIUrl = "https://api.themoviedb.org/3"
    private let urlSession = 
    
}
