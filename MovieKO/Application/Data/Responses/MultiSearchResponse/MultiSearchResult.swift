//
//  MultiSearchResultResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation

struct MultiSearchResult: Codable, MockableModel,Equatable {
    
    let id: Int?
    let knownForDepartment: String?
    let mediaType: MediaType?
    let name: String?
    let profilePath :String?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
    let firstAirDate: String?

    
    enum CodingKeys: String, CodingKey {
        case id
        case knownForDepartment
        case mediaType
        case name
        case profilePath
        case originalTitle
        case overview
        case posterPath
        case releaseDate
        case title
        case voteAverage
        case voteCount
        case firstAirDate
    }
    
    
    
    static var mock: Self {
        return MultiSearchResult(id: 155087, knownForDepartment: "", mediaType: MediaType.person, name: "İngiliz KemalMock", profilePath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg",originalTitle: "İngilizKemal Mockable", overview: "Mock kemal mockablelardayız bu hafta", posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg", releaseDate: "1967-02-12", title: "TitleMock", voteAverage: 10, voteCount: 1, firstAirDate: "")
        
    }
}



//MARK: - Mediatype


enum MediaType: String, Codable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
}




