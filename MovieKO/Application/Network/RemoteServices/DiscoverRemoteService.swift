//
//  DiscoverRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.11.2022.
//

import Foundation

protocol DiscoverRemoteServiceProtocol {
    
    func getDiscover(discoverType:String,sortType:String,
                     handler: @escaping(Result<DiscoverResponse,Error>) -> Void )
    
}

final class DiscoverRemoteService: DiscoverRemoteServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    func getDiscover(discoverType:String,sortType:String,
                     handler: @escaping(Result<DiscoverResponse,Error>) -> Void ) {
        let requestObject = TargetEndPoint.discover(discoverType: discoverType, sort: sortType).commonRequestObject
        request(with: requestObject, completionHandler: handler)
        
    }
}
