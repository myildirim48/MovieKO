//
//  DetailCard.swift
//  MovieKO
//
//  Created by YILDIRIM on 21.11.2022.
//

import SwiftUI

struct DetailCard: View {
    @State var detailModel : SearchedDetailsUIModel
    //Here is need update
    var body: some View {
        VStack(spacing: 5) {
            Text(detailModel.detailedObjectTitle).font(.title).fontWeight(.bold)
            LoadableImage(url:URL(string: detailModel.detailPhotoUI), widthPo:UIScreen.main.bounds.size.width, heightPo: 250)
        }

        //Details
        VStack(spacing: 10) {


            Text(detailModel.detailOverBio)
                .multilineTextAlignment(.leading).font(.headline)

            HStack {
                Text(detailModel.ratingTextUi).foregroundColor(.yellow).font(.caption)
                Text(detailModel.scoreTextUi).font(.caption2)
            }

            HStack(alignment: .top, spacing: 5) {
                if let cast = detailModel.cast, !cast.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starring").font(.headline)
                        ForEach(cast.prefix(9)) { Text($0.name) }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()

                }

                if let crew =  detailModel.crew, !crew.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        if let directors =  detailModel.directors, !directors.isEmpty {
                            Text("Director(s)").font(.headline)
                            ForEach(directors.prefix(2)) { Text($0.name) }
                        }

                        if let producers =  detailModel.producers, !producers.isEmpty {
                            Text("Producer(s)").font(.headline)
                                .padding(.top)
                            ForEach(producers.prefix(2)) { Text($0.name) }
                        }

                        if let screenwriters =  detailModel.screenWriters, !screenwriters.isEmpty {
                            Text("Screenwriter(s)").font(.headline)
                                .padding(.top)
                            ForEach(screenwriters.prefix(2)) { Text($0.name) }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(10)

            if let trailers = detailModel.youtubeTrailers, !trailers.isEmpty {
                    Text("Trailers").font(.headline)
                    ForEach(trailers) { trailer in
                        Button(action: {
                            guard let url = trailer.youtubeURL else { return }
                            UIApplication.shared.open(url)
                        }) {
                            HStack(spacing: 10) {
                                Text(trailer.name).foregroundColor(.black)
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(Color(UIColor.systemBlue))
                                    .frame(width: 35,height: 35)
                            }
                        }
                    }
            }

        }


    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(detailModel: SearchedDetailsUIModel.mock)
    }
}
