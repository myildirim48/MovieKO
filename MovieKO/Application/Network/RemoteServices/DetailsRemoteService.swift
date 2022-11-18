//
//  DetailsRemoteService.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation


protocol DetailsServiceProtocol {

    
    func loadSearchedMovie(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void)
    func loadSearchedTv(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void)
    func loadSearchedPerson(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void)
    
}

final class DetailsRemoteService: DetailsServiceProtocol, Requestable {
    
    typealias TargetEndPoint = SearchEndPoints
    
    //Update the func for other search items: tv,person
    
    
    //MARK: - Coolie type of my code My Master Update Here please :)
    
    //Get details for Movies
    func loadSearchedMovie(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        var requestObject = TargetEndPoint.movie(id: itemId).commonRequestObject
            requestObject.parameters["append_to_response"] = "videos,credits"
            request(with: requestObject, completionHandler: handler)
        }
        
    //Get details for TV
    func loadSearchedTv(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        var requestObject = TargetEndPoint.tv(id: itemId).commonRequestObject
            requestObject.parameters["append_to_response"] = "videos,credits"
            request(with: requestObject, completionHandler: handler)
        }
    
    //Get details for Person
    func loadSearchedPerson(itemId: Int,
                           handler: @escaping (Result<DetailResponseResult, Error>) -> Void){
        var requestObject = TargetEndPoint.person(id: itemId).commonRequestObject
            requestObject.parameters["append_to_response"] = "videos,credits"
            request(with: requestObject, completionHandler: handler)
        }
    
    
}
