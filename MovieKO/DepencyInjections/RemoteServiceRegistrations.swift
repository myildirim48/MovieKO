//
//  RemoteServiceRegistrations.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import Resolver

extension DependencyRegistrationService {
    func registerRemoteServices() {
        Resolver.register { SearchRemoteService() as SearchServiceProtocol }
        Resolver.register { DetailsRemoteService() as DetailsServiceProtocol }
    }
}
