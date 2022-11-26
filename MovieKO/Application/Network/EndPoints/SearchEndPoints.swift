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
    case multiSearch
    case discover(discoverType:String,sort: String)
    
    var path: String {
        
        switch self{
        case .detail(type: let type, id: let id): return "/3/\(type)/\(id)"
        case .multiSearch: return "/3/search/multi"
        case .discover(discoverType: let discType,sort: let sort) : return  "/3/\(discType)/\(sort)"
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

