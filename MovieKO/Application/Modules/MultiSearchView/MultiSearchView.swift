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
    private var search = ["Avatar","Spider Man","Matrix","Deadpool","Star Wars"]
    var searchNum = Int.random(in: 0..<5)
    
    var body: some View {
       
            List(searchViewModel.searchResult) { result in
                NavigationLink(destination: DetailView(searchedId: result.id, searchedMediaType: result.searchedObjectTypeUI)){
                    SearchCard(modelSearch: result)
                }
            }.navigationTitle("Search")
                .searchable(text: $searchTerm,
                            prompt: "Enter keyword to search")
            
                .onChange(of: searchTerm) { newValue in
                    searchViewModel.search(text: newValue)
                }.onAppear{
                    searchTerm = search[searchNum]
                }
        
    }
    
}

struct MultiSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSearchView()
    }
}
