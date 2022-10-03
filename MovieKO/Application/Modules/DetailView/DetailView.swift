//
//  DetailView.swift
//  MovieKO
//
//  Created by YILDIRIM on 23.09.2022.
//

import SwiftUI

struct DetailView: View {
    
    
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
