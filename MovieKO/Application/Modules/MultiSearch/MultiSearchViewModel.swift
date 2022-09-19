//
//  MultiSearchViewModel.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI
import Resolver

extension MultiSearchView {
    @MainActor class ViewModel : ObservableObject {
        
        @Injected private var repository: MultiSearchRepositoryProcol
        @Published private(set) var searchResult : [MultiSearchResult] = []
        private var fullResults: [MultiSearchResult] = []
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
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    self.fullResults = []
                    self.searchResult = []
                }
            }
            
            
        }
        
    }
}
