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
        HStack(spacing: 15){
            LoadableImage(url:model.posterPathURLUi)
            
            
            VStack(alignment: .leading, spacing: 15) {
                Text(model.originalTitle ?? "error").font(.title3).fontWeight(.medium)
                Text(model.overview!.prefix(110))
                        .multilineTextAlignment(.leading).font(.subheadline)
                Button("Read More...") {
                    //Button Action READMORE
                    
                    
                }.foregroundColor(.blue)
                
                HStack {
                    Text("\(model.yearTextUi)  | ").font(.callout)
                    Text(model.ratingTextUi).foregroundColor(.yellow).font(.callout).fontWeight(.bold)
                    Text(model.scoreTextUi).font(.callout)
                    
                    
                }
                
            }
        }.listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

struct MovieSearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(model: MovieSearchResultUIModel.mock)
    }
}
