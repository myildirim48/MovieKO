//
//  DetailView.swift
//  MovieKO
//
//  Created by YILDIRIM on 23.09.2022.
//

import SwiftUI

struct DetailView: View {
    //DetailView
    @StateObject private var detailVM = DetailViewModel()
    
    
    //Data's from the multisearch Screen
    let searchedId: Int
    let searchedMediaType: String
    
    
    
    var body: some View {
        ScrollView{
                VStack(spacing: 5) {
                    VStack(spacing: 5) {
                        Text(detailVM.detailResult?.detailedObjectTitle ?? "").font(.title).fontWeight(.bold)
                        LoadableImage(url:URL(string: detailVM.detailResult?.detailPhotoUI ?? ""), widthPo:UIScreen.main.bounds.size.width, heightPo: 250)
                    }
                    
                   
                    
                    //Details
                    VStack(spacing: 10) {
                      
                        
                        Text(detailVM.detailResult?.overview ?? "")
                            .multilineTextAlignment(.leading).font(.headline)
                        
                        HStack {
                            Text(detailVM.detailResult?.ratingTextUi ?? "").foregroundColor(.yellow).font(.caption)
                            Text(detailVM.detailResult?.scoreTextUi ?? "").font(.caption2)
                        }
                        
                        HStack(alignment: .top, spacing: 5) {
                            if let cast = detailVM.detailResult?.cast, !cast.isEmpty {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Starring").font(.headline)
                                    ForEach(cast.prefix(9)) { Text($0.name) }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                
                            }
                            
                            if let crew =  detailVM.detailResult?.crew, !crew.isEmpty {
                                VStack(alignment: .leading, spacing: 4) {
                                    if let directors =  detailVM.detailResult?.directors, !directors.isEmpty {
                                        Text("Director(s)").font(.headline)
                                        ForEach(directors.prefix(2)) { Text($0.name) }
                                    }
                                    
                                    if let producers =  detailVM.detailResult?.producers, !producers.isEmpty {
                                        Text("Producer(s)").font(.headline)
                                            .padding(.top)
                                        ForEach(producers.prefix(2)) { Text($0.name) }
                                    }
                                    
                                    if let screenwriters =  detailVM.detailResult?.screenWriters, !screenwriters.isEmpty {
                                        Text("Screenwriter(s)").font(.headline)
                                            .padding(.top)
                                        ForEach(screenwriters.prefix(2)) { Text($0.name) }
                                    }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(10)
                        
                        if let trailers = detailVM.detailResult?.youtubeTrailers, !trailers.isEmpty {
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
            .onAppear {
                // - Media Type Selection
                
                detailVM.detailID = searchedId
                detailVM.detailMediaType = searchedMediaType
                
                if searchedMediaType == "Tv"{
                    detailVM.getTv(tvId: Int(searchedId))
                }else if searchedMediaType == "Movie" {
                    detailVM.getMovie(movieId: Int(searchedId), mediaType: searchedMediaType)
                }else {
                    detailVM.getPerson(personId: Int(searchedId))
                }
            }
        }
    }}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(searchedId: 1, searchedMediaType: "Person")
    }
}

