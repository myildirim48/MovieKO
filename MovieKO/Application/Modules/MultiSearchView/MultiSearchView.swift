//
//  MultiSearchView.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI

struct MultiSearchView: View {
    @StateObject private var searchViewModel = MultiSearchViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
           
            List(searchViewModel.searchResult) { result in
                NavigationLink(destination: DetailView(searchedId: result.id, searchedMediaType: result.searchedObjectTypeUI)){
                    SearchCard(model: result)
                }
            }.navigationTitle("Search")
                .searchable(text: $searchTerm,
                            prompt: "Enter keyword to search")
            
                .onChange(of: searchTerm) { newValue in

                    searchViewModel.search(text: newValue)
                }
          
        }
    }
    
}

struct MultiSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSearchView()
    }
}
