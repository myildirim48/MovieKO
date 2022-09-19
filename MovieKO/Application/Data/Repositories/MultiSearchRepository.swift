//
//  MultiSearchRepository.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation
import Resolver

protocol MultiSearchRepositoryProcol {
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MultiSearchResult],Error>) -> Void)
}

final class MultiSearchRepository: MultiSearchRepositoryProcol {
    
    @Injected private var service: SearchServiceProtocol
    
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MultiSearchResult], Error>) -> Void) {
        
        service.getSearchedItems(queryText: queryText, page: page) { result in
            switch result{
            case .success(let response):
                let searchModel = MultiSearchResult.convert(from: response)
                handler(.success(searchModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
        
    }
}
