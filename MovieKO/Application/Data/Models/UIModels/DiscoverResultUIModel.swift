//
//  DiscoverResultUIModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.11.2022.
//

import Foundation
struct DiscoverResultUIModel: Codable, MockableModel,Equatable {
    let id: Int
    let title: String
    let posterPath: String?
    let backdropPath: String
    
    static var mock: DiscoverResultUIModel{
        return DiscoverResultUIModel(id: 123, title: "TitleMock", posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg", backdropPath: "/kmzppWh7ljL6K9fXW72bPN3gKwu.jpg")
    }
    
    static func == (lhs:DiscoverResultUIModel, rhs:DiscoverResultUIModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func converter(from response: DiscoverResponse ) -> [DiscoverResultUIModel] {
        return response.results.map { response in
            
            return DiscoverResultUIModel(id: response.id, title: response.title, posterPath: response.posterPath, backdropPath: response.backdropPath)
            
        }
    }
}
