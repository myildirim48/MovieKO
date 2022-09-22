//
//  MultiSearchResultResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation

struct MultiSearchResult: Decodable, MockableModel,Equatable {
    let id: Int?
    let knownForDepartment: KnownForDepartment?
    let mediaType: MediaType?
    let name: String?
    let profilePath, backdropPath: String?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let firstAirDate: String?
    let originalName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case knownForDepartment
        case mediaType
        case name
        case profilePath
        case backdropPath
        case originalTitle
        case overview
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
        case firstAirDate
        case originalName
    }
    
    static var mock: Self {
        return MultiSearchResult(backdropPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg",
                                 genreIDS: [28,12], id: 493086,
                                 originalLanguage: "tr", originalTitle: "İngiliz Kemal", overview: "MockOverView", popularity: 0.6, posterPath: "/9mnXOxmkZSQCHjprx47CnamBEOk.jpg", releaseDate: "1968-12-17", title: "İngiliz Kemal", video: false, voteAverage: 9, voteCount: 1)
        
    }
}


enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case camera = "Camera"
    case writing = "Writing"
}



enum MediaType: String, Codable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
}




