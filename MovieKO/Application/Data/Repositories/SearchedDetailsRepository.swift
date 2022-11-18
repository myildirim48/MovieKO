//
//  SearchedDetailsRepository.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation
import Resolver

protocol SearchedDetailsRepositoryProtocol {
    
    // Movie
    func loadSearchedMovie(itemId: Int,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void)
    //Tv
    
    func loadSearchedTv(itemId: Int,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void)
    
    //Person
    
    func loadSearchedPerson(itemId: Int,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void)
    
}

final class SearchedDetailsRepository: SearchedDetailsRepositoryProtocol {
    
    @Injected private var serviceDetail : DetailsServiceProtocol
    
    
    //here will be update because its like a coolie codes
    
    // Movie
    func loadSearchedMovie(itemId: Int,
                           handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void) {
        serviceDetail.loadSearchedMovie(itemId: itemId) { result in
            switch result {
            case .success(let response):
                let uiDetailMovie = SearchedDetailsUIModel.converted(from: response)
                handler(.success(uiDetailMovie))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    // TV
    func loadSearchedTv(itemId: Int, handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void) {
        serviceDetail.loadSearchedTv(itemId: itemId) { result in
            switch result {
            case .success(let response):
                let uiDetailTv = SearchedDetailsUIModel.converted(from: response)
                handler(.success(uiDetailTv))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    //Person
    
    func loadSearchedPerson(itemId: Int, handler: @escaping (Result<SearchedDetailsUIModel, Error>) -> Void) {
        serviceDetail.loadSearchedPerson(itemId: itemId) { result in
            switch result {
            case .success(let response):
                let uiDetailPerson = SearchedDetailsUIModel.converted(from: response)
                handler(.success(uiDetailPerson))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
