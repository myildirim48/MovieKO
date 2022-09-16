//
//  UserFacedError.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation

enum UserFaceError: LocalizedError {
    case noResult
    
    var errorDescription: String?{
        switch self {
        case .noResult:
            return "No results to display"
        }
    }
}
