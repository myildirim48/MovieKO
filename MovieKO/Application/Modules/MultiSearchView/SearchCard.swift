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
        HStack(spacing: 10){
            LoadableImage(url:URL(string: model.searchedObjectPhotoUI))
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(model.searchedObjectTitle).font(.title3).fontWeight(.medium)
                Text(model.searchedObjectTypeUI)
                Text(model.overview?.prefix(110) ?? "")
                        .multilineTextAlignment(.leading).font(.subheadline)
            
                
                HStack {
                    Text("\(model.yearTextUi)  | ").font(.callout)
                    Text(model.ratingTextUi).foregroundColor(.yellow).font(.caption2)
                    Text(model.scoreTextUi).font(.caption2)
                    
                    
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
