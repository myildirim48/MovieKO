//
//  MultiSearchCard.swift
//  MovieKO
//
//  Created by YILDIRIM on 19.09.2022.
//

import SwiftUI

struct SearchCard: View {
    
    @State var modelSearch: MovieSearchResultUIModel
    
    var body: some View {
        HStack(spacing: 10){
            LoadableImage(url:URL(string: modelSearch.searchedObjectPhotoUI),widthPo: 110,heightPo: 140)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(modelSearch.searchedObjectTitle).font(.title3).fontWeight(.medium)
                Text(modelSearch.searchedObjectTypeUI)
                Text(modelSearch.overview?.prefix(110) ?? "")
                        .multilineTextAlignment(.leading).font(.subheadline)
            
                
                HStack {
                    Text("\(modelSearch.yearTextUi)  | ").font(.callout)
                    Text(modelSearch.ratingTextUi).foregroundColor(.yellow).font(.caption2)
                    Text(modelSearch.scoreTextUi).font(.caption2)
                    
                    
                }
                
            }
        }.listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

struct MovieSearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(modelSearch: MovieSearchResultUIModel.mock)
    }
}
