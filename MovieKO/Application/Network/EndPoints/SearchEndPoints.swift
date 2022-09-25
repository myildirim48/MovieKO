//
//  SearchEndPoints.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation

enum SearchEndPoints: TargetEndpointProtocol {
    
    
    var base: String{
        AppConfig.baseURL
    }
    
    case movie(id:String)
    case tv(id:String)
    case person(id:String)
    case multiSearch
    
    var path: String {
        
        switch self{
            
        case .movie(id: let id): return "/3/movie/\(id)"
            
        case .tv(id: let id): return "/3/tv/\(id)"
            
        case .person(id: let id): return "/3/person/\(id)"
            
        case .multiSearch: return "/3/search/multi"
            
        }
        
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var commonRequestObject: RequestObject {
        var requestObject = RequestObject(host: base, path: path, httpMethpd: httpMethod)
        requestObject.parameters["api_key"] = AppConfig.apikey
        return requestObject
    }

}

