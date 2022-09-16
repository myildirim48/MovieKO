//
//  LoadableImageView.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import SwiftUI

struct LoadableImageView: View {
    
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image("PlaceholderImage").resizable().aspectRatio( contentMode: .fit)
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
            
        }
    }
}

struct LoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageView()
    }
}
