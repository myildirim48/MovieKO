//
//  DetailCard.swift
//  MovieKO
//
//  Created by YILDIRIM on 21.11.2022.
//

import SwiftUI

struct DetailCard: View {
    @State var detailModel : SearchedDetailsUIModel
    
    var body: some View {
        VStack {
            LoadableImage(url:URL(string: detailModel.detailPhotoUI), widthPo:UIScreen.main.bounds.size.width , heightPo: UIScreen.main.bounds.size.width / 1.2)
            
            //Details
            VStack(alignment: .leading, spacing: 20) {
                Text(detailModel.detailedObjectTitle).font(.title).fontWeight(.bold)
              
                Text(detailModel.overview ?? "")
                        .multilineTextAlignment(.leading).font(.subheadline)
            
                
                HStack {
                
                    
                    Text(detailModel.ratingTextUi).foregroundColor(.yellow).font(.caption2)
                    Text(detailModel.scoreTextUi).font(.caption2)
                    
                    
                }
                
            }
            Spacer()
            
        }
        
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(detailModel: SearchedDetailsUIModel.mock)
    }
}
