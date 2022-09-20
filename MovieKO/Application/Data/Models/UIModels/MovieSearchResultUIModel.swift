//
//  MovieSearchResultUIModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 20.09.2022.
//

import Foundation
struct MovieSearchResultUIModel:Identifiable,Equatable{
    
    let adult: Bool
      let backdropPath: String
      let genreIDS: [Int]
      let id: Int
      let originalLanguage: String
      let originalTitle, overview: String
      let popularity: Double
      let posterPath, releaseDate, title: String
      let video: Bool
      let voteAverage: Double
      let voteCount: Int
    
    
    static func == (lhs:MovieSearchResultUIModel, rhs: MovieSearchResultUIModel)-> Bool {
        return lhs.id == rhs.id
    }
    
    var backDropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath )")!
    }
    
    var posterPathURL: URL {
        return URL(string:"https://image.tmdb.org/t/p/w500\(posterPath )")!
    }
}

extension MovieSearchResultUIModel: MockableModel {
    
    static func convert(from response: MovieSearchResponse) -> [MovieSearchResultUIModel] {
        return response.results.map { response in
            
            return MovieSearchResultUIModel(adult: response.adult!, backdropPath: response.backdropPath!, genreIDS: response.genreIDS ?? [], id: response.id, originalLanguage: response.originalLanguage!, originalTitle: response.originalTitle!, overview: response.overview!, popularity: response.popularity!, posterPath: response.posterPath!, releaseDate: response.releaseDate!, title: response.title!, video: response.video!, voteAverage: response.voteAverage!, voteCount: response.voteCount!)
        }
    }
    
    
    static var mock: MovieSearchResultUIModel {
        return MovieSearchResultUIModel(adult: true, backdropPath: "/eEtBGMENh3UBax2wz0ZvBzCzxPu.jpg", genreIDS: [], id: 2028871, originalLanguage: "tr", originalTitle: "OriginalTitleUIMock", overview: "OverviewMockUIModel", popularity: 3.362, posterPath: "/3Ib8vlWTrAKRrTWUrTrZPOMW4jp.jpg", releaseDate: "2022-02-24", title: "TitleMockUIMODEL", video: false, voteAverage: 6.4, voteCount: 136)
    }
}
