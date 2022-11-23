//
//  MovieSearchResultUIModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 20.09.2022.
//

import Foundation

struct MovieSearchResultUIModel:Identifiable,Equatable{
    
    let id : Int
    let mediaType: MediaType? 
    let profilePath :String?
    let name : String?
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    
    static func == (lhs:MovieSearchResultUIModel, rhs: MovieSearchResultUIModel)-> Bool {
        return lhs.id == rhs.id
    }
    
    var searchedObjectTitle: String {
        if title != nil {
            return title ?? "titleError"
        }else if name != nil {
            return name ?? "nameError"
        }else { return "ErrorObjectTitle"}
    }
    
    var searchedObjectPhotoUI: String{
        if posterPath != nil{
            return "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
        }else if profilePath != nil{
            return "https://image.tmdb.org/t/p/w500\(profilePath ?? "")"
        }
        else { return "" } //https://image.tmdb.org/t/p/w500/dJZdaQXZ0qSeT4BrTibVIyl2JcZ.jpg Atam
    }
    
    
    var searchedObjectTypeUI: String {
        switch mediaType{
        case .person : return "Person"
        case .tv : return "Tv"
        case .movie : return "Movie"
        case .none: return "FuckMovieType" //Update
        }
    }
    
    
    
    var ratingTextUi: String {
        let rating = Int(voteAverage ?? 0)
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
            return "n / a"
        }
        return MovieSearchResultUIModel.yearFormatter.string(from: date)
    }
    
    var scoreTextUi: String {
        guard ratingTextUi.count > 0 else {
            return "n / a"
        }
        return "\(ratingTextUi.count)/10"
    }
}

extension MovieSearchResultUIModel: MockableModel {
    
    static func convert(from response: MultiSearchResponse ) -> [MovieSearchResultUIModel] {
        return response.results.map { response in
            
            return MovieSearchResultUIModel(
                id: response.id, mediaType: response.mediaType, profilePath: response.profilePath, name: response.name,
                                            originalTitle: response.originalTitle, overview: response.overview, posterPath: response.posterPath, releaseDate: response.releaseDate, title: response.title, voteAverage: response.voteAverage, voteCount: response.voteCount)
            
        }
    }
    
    static var mock: MovieSearchResultUIModel {
        
        return MovieSearchResultUIModel(id: 302110, mediaType: MediaType.movie, profilePath: "/dJZdaQXZ0qSeT4BrTibVIyl2JcZ.jpg", name: "name",

                                        originalTitle: "İngiliz Kemal Lawrens'e Karşı",
                                        overview: "Plans to take over the task of the British spy who came to Istanbul to Anatolia by Kemal’s story of said British: Lawrence.",
                                        posterPath: "/AkYWPGZY1OJSWoF3B8THSlcxHkh.jpg", releaseDate: "1952-10-11", title: "İngiliz Kemal Lawrens'e Karşı",
                                        voteAverage: 4.5, voteCount: 2)
    }
}
