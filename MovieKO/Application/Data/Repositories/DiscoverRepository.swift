//
//  DiscoverRepository.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.11.2022.
//

import Foundation
import Resolver

protocol DiscoverRepositoryProtocol {
    func getDiscoverRep(discoverType:String,sortType:String,
                     handler: @escaping(Result<[DiscoverResultUIModel],Error>) -> Void )
}

final class DiscoverRepository : DiscoverRepositoryProtocol {
    
    @Injected private var serviceDiscover: DiscoverRemoteServiceProtocol
    
    func getDiscoverRep(discoverType:String,sortType:String,
                     handler: @escaping(Result<[DiscoverResultUIModel],Error>) -> Void ) {
        
        serviceDiscover.getDiscover(discoverType: discoverType, sortType: sortType) { result in
            switch result {
            case .success(let response):
                let uiDiscoverModel = DiscoverResultUIModel.converter(from: response)
                handler(.success(uiDiscoverModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
        
    }
}
