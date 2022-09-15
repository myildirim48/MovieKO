//
//  HTTPURLResponseExtensions.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation

extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
