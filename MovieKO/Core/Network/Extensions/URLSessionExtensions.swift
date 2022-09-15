//
//  URLSessionExtensions.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation

extension URLSession: NetworkLoader {
    
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        try await self.data(for: request,delegate: delegate)
    }
    
    func load(using request: URLRequest, with completion: @escaping(Data?,URLResponse?,Error?) -> Void){
        self.dataTask(with: request, completionHandler: completion).resume()
    }
}
