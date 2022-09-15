//
//  HTTPMethod.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
enum HTTPMethod: String, CustomStringConvertible{
    case get
    case post
    case put
    case delete
    
    var description: String{
        rawValue.uppercased()
    }
}
