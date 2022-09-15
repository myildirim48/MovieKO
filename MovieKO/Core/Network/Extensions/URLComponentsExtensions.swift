//
//  URLComponentsExtensions.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
extension URLComponents{
    mutating func setQueryItems(with parameters: [String:String]){
        queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
    }
}
