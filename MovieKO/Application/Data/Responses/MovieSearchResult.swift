//
//  MovieSearchResultResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation
struct MovieSearchResults: Decodable,MockableModel,Equatable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    static var mock: Self {
        
        return MovieSearchResults(adult: true, backdropPath: "/eEtBGMENh3UBax2wz0ZvBzCzxPu.jpg", genreIDS: [], id: 2028871, originalLanguage: "TR", originalTitle: "OriginalTitleMock", overview: "OverviewMOCK", popularity: 3.362, posterPath: "/3Ib8vlWTrAKRrTWUrTrZPOMW4jp.jpg", releaseDate: "2022-02-24", title: "TitleMOCK", video: false, voteAverage: 6.4, voteCount: 136)
    }
}

enum OriginalLanguage: String, Decodable {
    case bs = "bs"
    case de = "de"
    case en = "en"
    case sh = "sh"
    case sv = "sv"
    case tr = "tr"
}




