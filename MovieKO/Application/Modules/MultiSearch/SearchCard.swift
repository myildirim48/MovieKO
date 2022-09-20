//
//  MultiSearchCard.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI

struct SearchCard: View {
    
    @State var model: MovieSearchResultUIModel
    
    var body: some View {
        HStack(spacing: 20){
            LoadableImage(url:model.posterPathURL)
                
            
            VStack(alignment: .leading,spacing: 10) {
                Text(model.originalTitle).fontWeight(.bold)
                Text(model.title)
                Text(model.title)
                Text(model.title)
                
            }
        }
    }
}

struct MovieSearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(model: MovieSearchResultUIModel.mock)
    }
}
