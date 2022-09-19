//
//  MultiSearchResultResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Foundation
struct MultiSearchResult: Codable, MockableModel {
    
    let adult: Bool?
    let gender: Int?
    let id: Int
    let knownFor: [MultiSearchResult]?
    let knownForDepartment: String?
    let mediaType: MediaType
    let name: String?
    let popularity: Double?
    let profilePath, backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let firstAirDate: String?
    let originCountry: [OriginCountry]?
    let originalName: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case gender
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name
        case profilePath = "profile_path"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case originalName = "original_name"
    }
    
    
    
    
    static var mock: Self {
        return MultiSearchResult(adult: false,
                                 gender: 2,
                                 id: 97272,
                                 knownFor: nil,
                                 knownForDepartment: "Acting",
                                 mediaType: MediaType(rawValue: "person")!,
                                 name: "Kemal Sunal",
                                 popularity: 3.208,
                                 profilePath: "/yInEervrgOkV24vTFOfy7MlLB0A.jpg",
                                 backdropPath: "/eEtBGMENh3UBax2wz0ZvBzCzxPu.jpg",
                                 genreIDS: [12,18,28,10752],
                                 originalLanguage: OriginalLanguage(rawValue: "tr")!,
                                 originalTitle: "Fetih 1453",
                                 overview: "After the death of his father Murat II, Mehmet II ascends to the Ottoman throne. After braving internal and external enemies, he decides to complete what he was destined to do: Conquer Constantinople.",
                                 posterPath: "/xzTAM0yaOKkdD4C2tVbdHilcNAc.jpg",
                                 releaseDate: "2012-02-16",
                                 title: "Conquest 1453",
                                 video: false,
                                 voteAverage: 6,
                                 voteCount: 145,
                                 firstAirDate: "2012-09-04",
                                 originCountry: [OriginCountry.tr],
                                 originalName: "Ezel")
    }
    
}


extension MultiSearchResult {
    static func convert(from response: MultiSearchResponse) -> [MultiSearchResult] {
        return response.results.map { response in
            return MultiSearchResult(adult: response.adult, gender: response.gender, id: response.id, knownFor: response.knownFor, knownForDepartment: response.knownForDepartment, mediaType: response.mediaType, name: response.name, popularity: response.popularity, profilePath: response.profilePath, backdropPath: response.backdropPath, genreIDS: response.genreIDS, originalLanguage: response.originalLanguage, originalTitle: response.originalTitle, overview: response.overview, posterPath: response.posterPath, releaseDate: response.releaseDate, title: response.title, video: response.video, voteAverage: response.voteAverage, voteCount: response.voteCount, firstAirDate: response.firstAirDate, originCountry: response.originCountry, originalName: response.originalName)
        }
    }
}


enum KnownForDepartment: String, Codable {
    case acting = "Acting"
}

enum MediaType: String, Codable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
}

enum OriginCountry: String, Codable {
    case eg = "EG"
    case tr = "TR"
    case us = "US"
}
enum OriginalLanguage: String, Codable {
    case bs = "bs"
    case de = "de"
    case en = "en"
    case id = "id"
    case sh = "sh"
    case tr = "tr"
}


