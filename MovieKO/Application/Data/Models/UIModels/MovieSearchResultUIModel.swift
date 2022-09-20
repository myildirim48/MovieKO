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
    let posterPath : String
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    
    static func == (lhs:MovieSearchResultUIModel, rhs: MovieSearchResultUIModel)-> Bool {
        return lhs.id == rhs.id
    }
    
    var backDropURLUi: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath )")!
    }
    
    var posterPathURLUi: URL {
        return URL(string:"https://image.tmdb.org/t/p/w500\(posterPath )")!
    }
    var ratingTextUi: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    var yearTextUi : String {
        guard let releaseDate = self.releaseDate, let date = DateFormatterStruct.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return MovieSearchResultUIModel.yearFormatter.string(from: date)
    }
    
    var scoreTextUi: String {
        guard ratingTextUi.count > 0 else {
            return "n/a"
        }
        return "\(ratingTextUi.count)/10"
    }
}

extension MovieSearchResultUIModel: MockableModel {
    
    static func convert(from response: MovieSearchResponse) -> [MovieSearchResultUIModel] {
        return response.results.map { response in
            
            return MovieSearchResultUIModel(adult: response.adult ?? false,
                                            backdropPath: response.backdropPath ?? "",
                                            genreIDS: response.genreIDS ?? [],
                                            id: response.id,
                                            originalLanguage: response.originalLanguage ?? "",
                                            originalTitle: response.originalTitle ?? "",
                                            overview: response.overview ?? "",
                                            popularity: response.popularity ?? 0,
                                            posterPath: response.posterPath ?? "",
                                            releaseDate: response.releaseDate ?? "",
                                            title: response.title ?? "",
                                            video: response.video ?? false,
                                            voteAverage: response.voteAverage ?? 0,
                                            voteCount: response.voteCount ?? 0)
        }
    }
    
    
    static var mock: MovieSearchResultUIModel {
        return MovieSearchResultUIModel(adult: true, backdropPath: "/eEtBGMENh3UBax2wz0ZvBzCzxPu.jpg", genreIDS: [], id: 2028871, originalLanguage: "tr", originalTitle: "OriginalTitleUIMock", overview: "OverviewMockUIModel,OverviewMockUIModel,OverviewMockUIModel.", popularity: 3.362, posterPath: "/3Ib8vlWTrAKRrTWUrTrZPOMW4jp.jpg", releaseDate: "2022-02-24", title: "TitleMockUIMODEL", video: false, voteAverage: 6.4, voteCount: 136)
    }
}
