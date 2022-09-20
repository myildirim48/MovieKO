//
//  MultiSearchViewModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI
import Resolver

extension MultiSearchView {
    @MainActor class MultiSearchViewModel : ObservableObject {
        
        @Published var userInput = ""
        @Published var executionTime = 0
        
        @Injected private var repository: MovieSearchRepositoryProtocol
        @Published private(set) var searchResult : [MovieSearchResultUIModel] = []
        private var fullResults: [MovieSearchResultUIModel] = []
        @State var searchText: String = ""
        
        func search(text: String){
            
            guard !text.isEmpty else {
                searchResult = []
                return
            }
            if !fullResults.isEmpty {
                searchResult = fullResults
                return
            }
            
            repository.getSearched(queryText: text, page: 1) { result in
                switch result {
                case .success(let model): 
                    DispatchQueue.main.async {
                        self.fullResults = model
                        self.searchResult = model
                        
                        print(self.fullResults) //For Test
                        print(self.searchResult)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                        self.fullResults = []
                        self.searchResult = []
                        
                    }
                }
            }
            
            
        }
        
    }
}
