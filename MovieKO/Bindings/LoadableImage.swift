//
//  LoadableImageView.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import SwiftUI

struct LoadableImage: View {
    
    var url : URL?
    var widthPo : CGFloat?
    var heightPo : CGFloat?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .frame(width: widthPo, height: heightPo)
            case .failure:
                Image("PlaceholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .frame(width: 85, height: 85)
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
    }
}
struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage()
    }
}
