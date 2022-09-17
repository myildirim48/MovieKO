//
//  BaseServiceProtocol.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
import Resolver

protocol BaseServiceProtocol {
    
    func request<T: Decodable> (with requestObject: RequestObject,
                              decoder: JSONDecoder,
                              handler: @escaping (Result<T, Error>) -> Void)
}

extension BaseServiceProtocol {
    
    func request<T: Decodable> (with requestObject: RequestObject,
                              decoder: JSONDecoder = Resolver.resolve(),
                              handler: @escaping (Result<T, Error>) -> Void) {
        request(with: requestObject, decoder: decoder, handler: handler)
    }
    
}

