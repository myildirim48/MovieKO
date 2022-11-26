//
//  RepositoryRegistrations.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//
import Foundation
import Resolver

extension DependencyRegistrationService{
    func registerRepositories(){
        Resolver.register { MovieSearchRepository() as MovieSearchRepositoryProtocol }
        Resolver.register { DetailsRepository() as DetailsRepositoryProtocol }
        Resolver.register { DiscoverRepository() as DiscoverRepositoryProtocol }
    }
}
