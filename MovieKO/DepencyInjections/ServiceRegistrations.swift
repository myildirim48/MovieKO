//
//  ServiceRegistrations.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerService() {
        Resolver.register { URLSession(configuration: .default) as NetworkLoader}
        Resolver.register { NetworkService() as BaseServiceProtocol}
        Resolver.register {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            return dateFormatter
        }
        Resolver.register {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Resolver.resolve())
            return decoder
        }
        Resolver.register {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(Resolver.resolve())
            return encoder
        }
    }
}
