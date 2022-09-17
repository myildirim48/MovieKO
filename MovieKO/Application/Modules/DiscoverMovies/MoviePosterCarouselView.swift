//
//  MoviePosterCarouselView.swift
//  MovieKO
//
//  Created by YILDIRIM on 16.09.2022.
//

import SwiftUI

struct MoviePosterCarouselView: View {
        
    let title: String
   // let movies: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top, spacing: 15){
                    
                    
                }
            }
        }.padding(.leading, 16)
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "asdsa")
    }
}
