//
//  DetailsRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation


protocol DetailsServiceProtocol {
    func loadDetailsOfSearchedItem(itemId: Int,itemType: String, appendToResponse: String,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void)
    
}

final class DetailsRemoteService: DetailsServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    //I added functionality to this func (itemType) "videos,credits"
    
    func loadDetailsOfSearchedItem(itemId: Int,itemType: String, appendToResponse: String,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        var requestObject = TargetEndPoint.detail(type: itemType, id: itemId).commonRequestObject
            requestObject.parameters["append_to_response"] = appendToResponse
            request(with: requestObject, completionHandler: handler)
        }
    
    
}
