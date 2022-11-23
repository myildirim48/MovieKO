//
//  SearchedDetailsRepository.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//
import Foundation
import Resolver

protocol DetailsRepositoryProtocol {
    
    // Movie
    func loadDetails(itemId: Int, itemType: String, appendToResponse: String,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void)
}

final class DetailsRepository: DetailsRepositoryProtocol {
    
    @Injected private var serviceDetail: DetailsServiceProtocol

    func loadDetails(itemId: Int, itemType: String, appendToResponse: String,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void) {
        
        serviceDetail.loadDetailsOfSearchedItem(itemId: itemId, itemType: itemType, appendToResponse: appendToResponse) { result in
            switch result {
            case .success(let response):
                let uiDetailMovie = SearchedDetailsUIModel.converted(from: response)
                handler(.success(uiDetailMovie))
               
                //Test-----------------------------------------------------------
//                print(uiDetailMovie)
                
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
