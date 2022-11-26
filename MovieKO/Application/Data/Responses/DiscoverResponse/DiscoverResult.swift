//
//  DiscoverResult.swift
//  MovieKO
//
//  Created by YILDIRIM on 24.11.2022.
//

import Foundation
struct DiscoverResult: Codable, MockableModel,Equatable {
    let id: Int
    let title: String
    let posterPath: String?
    let backdropPath: String
    
    static var mock: DiscoverResult{
        return DiscoverResult(id: 123, title: "TitleMock", posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg", backdropPath: "/kmzppWh7ljL6K9fXW72bPN3gKwu.jpg")
    }
    
}
