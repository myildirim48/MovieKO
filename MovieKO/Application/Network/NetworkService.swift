//
//  NetworkService.swift
//  MovieKO
//
//  Created by YILDIRIM on 17.09.2022.
//

import Foundation
import Resolver

final class NetworkService: BaseServiceProtocol {
    
    @Injected private var urlSession: NetworkLoader
    
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = Resolver.resolve(),
                               handler: @escaping (Result<T,Error>) -> Void){
        do {
            let urlRequest = try requestObject.getURLRequest()
            urlSession.load(using: urlRequest) { data, response, error in
                if let data = data {
                    do {
                        let object = try decoder.decode(T.self, from: data)
//                        print(object.self)
                        print(urlRequest)
                        
                        handler(.success(object))
                    }catch{
                        handler(.failure(error))
                    }
                } else if let error = error {
                    handler(.failure(error))
                }else {
                    handler(.failure(AppError.badResponse))
                }
            }
        }catch{
            handler(.failure(AppError.badResponse))
        }
    }
}
