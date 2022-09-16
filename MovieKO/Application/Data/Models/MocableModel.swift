//
//  MocableModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import Foundation
protocol MocableModel {
    static var mock: Self { get }
}
