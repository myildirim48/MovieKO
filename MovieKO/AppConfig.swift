//
//  AppConfig.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
enum AppEnvironment {
    case development
    case staging
    case production
}

final class AppConfig {
    
    static var apikey = "249671eff0295b9410c95cbf7aabbef4"
    
    static var configuration: AppEnvironment {
        #if DEVELOPMENT
        return .development
        #elseif PRODUCTION
        return .production
        #else
        return .staging
        #endif
    }
    
    static var baseURL: String {
        switch configuration {
        case .development:
            return "api.themoviedb.org/3"
        case .staging:
            return "api.themoviedb.org/3"
        case .production:
            return "api.themoviedb.org/3"
        }
    }
    
    static var imageURL: String {
        switch configuration {
        case .development:
            return "image.tmdb.org/t/p/w500/"
        case .staging:
            return "image.tmdb.org/t/p/w500/"
        case .production:
            return "image.tmdb.org/t/p/w500/"
        }
    }
}
