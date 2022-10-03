//
//  DetailsRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation
//Detail Remote Services

protocol DetailsServiceProtocol {
    //Remote Func
}

final class DetailsRemoteService: DetailsServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    func getSearchedItems(
                          
                          handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        
        var requestObject = TargetEndPoint.multiSearch.commonRequestObject
        requestObject.parameters["append_to_response"] = "videos,credits"
        request(with: requestObject, completionHandler: handler)
    }
}
