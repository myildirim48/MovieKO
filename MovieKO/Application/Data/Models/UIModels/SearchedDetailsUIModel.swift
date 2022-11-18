//
//  SearchedDetailsUIModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 26.09.2022.
//

import Foundation

struct SearchedDetailsUIModel: Identifiable, Equatable {
    
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
    
    //All
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    
    static func == (lhs:SearchedDetailsUIModel, rhs:SearchedDetailsUIModel) -> Bool {
        return lhs.id == rhs.id
    }
    
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

}

extension SearchedDetailsUIModel: MockableModel {
    //Enlighten me master about here
    
    static func converted(from response: DetailResponseResult) -> SearchedDetailsUIModel {
            
            return SearchedDetailsUIModel(id: response.id, title: response.title, name: response.name, backdropPath: response.backdropPath, posterPath: response.posterPath, overview: response.overview, voteAverage: response.voteAverage, voteCount: response.voteCount, runtime: response.runtime, releaseDate: response.releaseDate, profilePath: response.profilePath, tagline: response.tagline, biography: response.biography, placeOfBirth: response.placeOfBirth, birthDay: response.birthDay, deathDay: response.deathDay, credits: response.credits, videos: response.videos)
        
    }
    static var mock:Self {
        return SearchedDetailsUIModel(id: 123, title: "titleMockUI", name: "NameUIMock", backdropPath: "", posterPath: "", overview: "overviewMock", voteAverage: 12.3, voteCount: 12, runtime: 120, releaseDate: "12-03-1962", profilePath: "", tagline: "TaglineMock", biography: "BiograhyMockableUIMODEL UI MODEL Bİographt", placeOfBirth: "Çorum", birthDay: "30-01-2001", deathDay: "01-02-2022", credits: MovieCredit?.none, videos: MovieVideoResponse?.none)
    }
}
