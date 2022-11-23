//
//  DetailViewModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 3.10.2022.
//

import SwiftUI
import Resolver

//DetailViewModel -> Call get details func here

extension DetailView {
    @MainActor class DetailViewModel : ObservableObject {
        
        @Injected private var repository : DetailsRepositoryProtocol
        @Published private(set) var detailResult: SearchedDetailsUIModel? //I didnt understand the type here ??
        
        //Data from view
        var detailID: Int = 0
        var detailMediaType: String = ""
        
        // I will need refactoring here
        func getMovie(movieId: Int,mediaType: String){
            
                repository.loadSearchedMovie(itemId: movieId) { result in
                    switch result{
                    case .success(let model):
                        DispatchQueue.main.async {
                            self.detailResult = model
                    
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            print(error.localizedDescription)
                            self.detailResult = nil
                        }
                    }
            }
        }//:Movie
        
        func getTv(tvId: Int){
            repository.loadSearchedTv(itemId: tvId) { result in
                switch result{
                case .success(let model):
                    DispatchQueue.main.async {
                        self.detailResult = model
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                        self.detailResult = nil
                    }
                }
            }
        }//:TV
        
        func getPerson(personId: Int){
            repository.loadSearchedPerson(itemId: personId) { result in
                switch result{
                case .success(let model):
                    DispatchQueue.main.async {
                        self.detailResult = model
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                        self.detailResult = nil
                    }
                }
            }
        }//:Person
    }
}

