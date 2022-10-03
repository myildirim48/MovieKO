//
//  DetailsResponseReesult.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation

struct DetailResponseResult: Codable,MockableModel {
    
    
    let id: Int
    let title: String?
    let name: String?
    
    let backdropPath: String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    let runtime: Int?
    let releaseDate: String?
    let profilePath: String?
    let tagline: String?
    
    //Person
    let biography: String?
    let placeOfBirth: String?
    let birthDay: String?
    let deathDay: String?
    
    //TV
    let numberOfSeasons: Int?
    let numberOfEpisodes: Int?
    
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    
    //MARK: - Credits,Videos
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    var crew: [MovieCrew]? {
        credits?.crew
    }
    
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }

    
    static var mock:Self {
        return DetailResponseResult(id: 123, title: "titleMock", name: "NameMock", backdropPath: "", posterPath: "", overview: "overviewMock", voteAverage: 12.3, voteCount: 12, runtime: 120, releaseDate: "12-03-1962", profilePath: "", tagline: "TaglineMock", biography: "BiograhyMockable", placeOfBirth: "Çorum", birthDay: "30-01-2001", deathDay: "01-02-2022", numberOfSeasons: 9, numberOfEpisodes: 235, credits: MovieCredit?.none, videos: MovieVideoResponse?.none)
    }
}

//MARK: - SpecialDataTypes
struct MovieGenre: Codable {
    
    let name: String
}

struct MovieCredit: Codable {
    
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Codable, Identifiable {
    let id: Int
    let character: String
    let name: String
}

struct MovieCrew: Codable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct MovieVideoResponse: Codable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Codable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
