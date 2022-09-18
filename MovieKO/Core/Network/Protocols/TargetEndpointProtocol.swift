//
//  TargetEndpointProtocol.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
protocol TargetEndpointProtocol {
    var base: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var commonRequestObject: RequestObject { get }
}
