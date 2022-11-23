//
//  DetailViewModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 3.10.2022.
//

import SwiftUI
import Resolver



extension DetailView {
    @MainActor class DetailViewModel : ObservableObject {
        
        @Injected private var repository : DetailsRepositoryProtocol
        @Published private(set) var detailResult: SearchedDetailsUIModel? //I didnt understand the type here ??
    
        
        func getDetailVM(movieId: Int,mediaType: String, appendToResponse: String){
            
            repository.loadDetails(itemId: movieId, itemType: mediaType, appendToResponse: appendToResponse) { result in
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
        }//Load data by mediaType
    }
}

