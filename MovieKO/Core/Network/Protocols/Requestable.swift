//
//  Requestable.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndPoint: TartgetEndpointProtocol
    
    func request<T:Decodable>(baseService: BaseServiceProtocol,
                              with object: RequestObject) async throws -> T
}

extension Requestable {
    
    func request<T:Decodable>(baseService: BaseServiceProtocol,
                              with object: RequestObject) async throws -> T{
        try await baseService.request(with: object)
    }
}
