//
//  MovieSearchRepository.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation
import Resolver

protocol MovieSearchRepositoryProtocol {
    
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MovieSearchResultUIModel],Error>) -> Void)
}

final class MovieSearchRepository: MovieSearchRepositoryProtocol {
    
    @Injected private var service: SearchServiceProtocol
    
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MovieSearchResultUIModel], Error>) -> Void) {
        
        service.getSearchedItems(queryText: queryText, page: page) { result in
            switch result{
            case .success(let response):
                let uiMovieSearchModel = MovieSearchResultUIModel.convert(from: response)
                handler(.success(uiMovieSearchModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
        
    }
}
