//
//  AppConfig.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
enum AppEnvironment {
    case baseApiUrl
    case imageApiUrl
}

final class AppConfig {
    
    var apikey = "249671eff0295b9410c95cbf7aabbef4"
    
    static var environment: AppEnvironment {
        #if DEBUG
        return .baseApiUrl
        #else
        return .imageApiUrl
        #endif
    }
    
    static var baseURL: String {
        switch environment {
        case .baseApiUrl:
            return "https://api.themoviedb.org/3"
        case .imageApiUrl:
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
