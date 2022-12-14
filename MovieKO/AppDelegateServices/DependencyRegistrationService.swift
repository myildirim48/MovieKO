//
//  DependencyRegistrationService.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Resolver

final class DependencyRegistrationService : NSObject, UIApplicationDelegate {
    typealias Registration = () -> Void
    
    private lazy var registrations : [Registration] = [registerService,
                                                       registerRepositories,
                                                       registerRemoteServices]
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        register()
    }
    
    private func register() -> Bool {
        Resolver.defaultScope = .graph
        registrations.forEach{ $0() }
        return true
    }
    
}
