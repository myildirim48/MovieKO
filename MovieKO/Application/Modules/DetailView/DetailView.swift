//
//  DetailView.swift
//  MovieKO
//
//  Created by YILDIRIM on 23.09.2022.
//

import SwiftUI

struct DetailView: View {
    //DetailView
    @StateObject private var detailViewModel = DetailViewModel()
    
    //Data's from the multisearch Screen
    let searchedId: Int
    let searchedMediaType: String
    
    
    
    
    var body: some View {
        Text("id: \(searchedId), media: \(searchedMediaType)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(searchedId: 1, searchedMediaType: "Person")
    }
}
