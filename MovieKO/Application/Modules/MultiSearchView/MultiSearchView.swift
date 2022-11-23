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
    
    @State var random1 = false
    
    var body: some View {
       
       
            List(searchViewModel.searchResult) { result in
                NavigationLink(destination: DetailView(searchedId: result.id, searchedMediaType: result.searchedObjectTypeUI, appendToResponseUser: "")){
                    SearchCard(modelSearch: result)
                 
                }
            }.navigationTitle("Search")
                .searchable(text: $searchTerm,
                            prompt: "Enter keyword to search")
            
                .onChange(of: searchTerm) { newValue in
                    searchViewModel.search(text: newValue)
                }.onDisappear{
                    random1 = true
                }
                .onAppear{
                    if random1 == false || searchTerm == "" {
                        let searchNum = Int.random(in: 0..<5)
                        searchTerm = search[searchNum]
                    }
                }
        
    }
    
}

struct MultiSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSearchView()
    }
}
