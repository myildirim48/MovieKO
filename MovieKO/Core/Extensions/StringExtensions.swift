//
//  StringExtensions.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id : Int {
        return hash
    }
}
