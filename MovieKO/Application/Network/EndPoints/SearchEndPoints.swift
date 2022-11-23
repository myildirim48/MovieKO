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
    
    case detail(type:String,id:Int)

//    case tv(id:Int)
//    case person(id:Int)
    
    case multiSearch
    
    var path: String {
        
        switch self{
            
        case .detail(type: let type, id: let id): return "/3/\(type)/\(id)"
            
//        case .tv(id: let id): return "/3/tv/\(id)"
//
//        case .person(id: let id): return "/3/person/\(id)"
            
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

