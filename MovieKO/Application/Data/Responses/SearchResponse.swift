//
//  SearchResponse.swift
//  MovieKO
//
//  Created by YILDIRIM on 18.09.2022.
//

import Foundation

struct SearchResponse: Decodable,MockableModel,Equatable {

    // MARK: - MultSearch
    struct MultSearch: Codable {
        let page: Int
        let results: [Result]
        let totalPages, totalResults: Int

        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }

    // MARK: - Result
    struct Result: Codable {
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
        let knownFor: [Result]?
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
        return SearchResponse()
    }
}
