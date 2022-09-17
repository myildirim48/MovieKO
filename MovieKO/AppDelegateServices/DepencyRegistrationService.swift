//
//  DepencyRegistrationService.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Resolver

final class DepencyRegistrationService : NSObject, UIApplicationDelegate {
    typealias Registration = () -> Void
    
    private lazy var registrations : [Registration] = [registerService]
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        register()
    }
    
    private func register() -> Bool {
        Resolver.defaultScope = .graph
        registrations.forEach{ $0() }
        return true
    }
    
}
