//
//  ServiceRegistrations.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation
import Resolver

extension DepencyRegistrationService {
    func registerService() {
        Resolver.register { URLSession(configuration: .default) as NetworkLoader}
        Resolver.register { NetworkService() as BaseServiceProtocol}
        Resolver.register { JSONDecoder() }
        Resolver.register { JSONEncoder() }
    }
}
