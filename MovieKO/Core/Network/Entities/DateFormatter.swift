//
//  DateFormatter.swift
//  MovieKO
//
//  Created by YILDIRIM on 20.09.2022.
//

import Foundation
struct DateFormatterStruct {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
