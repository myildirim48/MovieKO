//
//  MultiSearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

struct MultiSearchResponse: Decodable,MockableModel,Equatable {

    // MARK: - MultSearch
    struct MultiSearch: Codable {
        let page: Int
        let results: [SearchResult]
        let totalPages, totalResults: Int

        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
        
    /*    static var mock: Self {
            return SearchResult(adult: true, backdropPath: "", genreIDS: [1], id: 1, mediaType: MultiSearchResponse.MediaType(rawValue: "movie") ?? "", originalLanguage: "tr", originalTitle: "TestMovie", overview: "TestMovie Overview", popularity: 1.2, posterPath: "posterpath", releaseDate: "", title: "Test Movie 1", video: true, voteAverage: 5.9, voteCount: 10, gender: 5, knownFor: [MultiSearchResponse.SearchResult]?, knownForDepartment: MultiSearchResponse.KnownForDepartment?, name: "Kemal", profilePath: "", firstAirDate: "", originCountry: [MultiSearchResponse.OriginCountry]?, originalName: "")
        }*/
        
    }

    // MARK: - Result
    struct SearchResult: Codable {
        let adult: Bool?
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int
        let mediaType: MediaType
        let originalLanguage, originalTitle, overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate, title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount, gender: Int?
        let knownFor: [SearchResult]?
        let knownForDepartment: KnownForDepartment?
        let name: String?
        let profilePath: String?
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

    
    
    static var mock: Self{
        return MultiSearchResponse()
    }
}
