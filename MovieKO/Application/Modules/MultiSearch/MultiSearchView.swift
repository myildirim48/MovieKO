//
//  MultiSearchView.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI

struct MultiSearchView: View {
    
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List {
                
            }.navigationTitle("Search")
                .searchable(text: $searchTerm,
                            prompt: "Enter keyword to search")
                .onChange(of: searchTerm) { newValue in
                    
                }
        }
    }
}

struct MultiSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSearchView()
    }
}
