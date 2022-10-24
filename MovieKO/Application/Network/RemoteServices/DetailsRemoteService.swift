//
//  DetailsRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation


protocol DetailsServiceProtocol {

    
    func loadSearchedItems(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void)
}

final class DetailsRemoteService: DetailsServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    //Update the func for other search items: tv,person
    
    func loadSearchedItems(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        var requestObject = TargetEndPoint.movie(id: itemId).commonRequestObject
            requestObject.parameters["append_to_response"] = "videos,credits"
            request(with: requestObject, completionHandler: handler)
        }
    
}
