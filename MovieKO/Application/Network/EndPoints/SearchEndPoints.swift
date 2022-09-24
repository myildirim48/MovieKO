//
//  SearchEndPoints.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation

struct SearchEndPoints: TargetEndpointProtocol {
    var base: String{
        AppConfig.baseURL
    }
    
    var path: String{
        return "/3/search/multi"
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

