//
//  SearchRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation

protocol SearchServiceProtocol {
    
    func getSearchedItems(queryText:String,
                          page: Int,
                          handler: @escaping (Result<MultiSearchResponse, Error>) -> Void)
}

final class SearchRemoteService: SearchServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    func getSearchedItems(queryText:String,
                          page: Int,
                          handler: @escaping (Result<MultiSearchResponse, Error>) -> Void){
        
        var requestObject = TargetEndPoint.multiSearch.commonRequestObject
        requestObject.parameters["query"] = queryText
//        requestObject.parameters["include_adult"] = "true"
        request(with: requestObject, completionHandler: handler)
    }
    
    
   
}
