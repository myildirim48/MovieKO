//
//  MovieService.swift
//  MovieKO
//
//  Created by YILDIRIM on 14.09.2022.
//

import Foundation

protocol MovieService{
    func fetchMovies(from endpoint: MovieListEndPoint,completion: @escaping(Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id:Int,comletion: @escaping(Result<Movie,MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping(Result<MovieResponse,MovieError>) ->)
    
}

enum MovieListEndPoint: String,CaseIterable{
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description:String{
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error,CustomNSError{
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serizalitaionError
    
    var localizedDescription: String{
        switch self{
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serizalitaionError: return "Failed to decode data"
            
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
