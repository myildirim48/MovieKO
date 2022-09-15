//
//  NetworkLoader.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation

protocol NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping(Data?,URLResponse?,Error?) -> Void)
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse)
}
