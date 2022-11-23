//
//  ContentView.swift
//  MovieKO
//
//  Created by YILDIRIM on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationView { HomeView() }
            .tabItem { Label("Home", systemImage: "film")}
            .tag(0)
            
            NavigationView { MultiSearchView() }
            .tabItem { Label("Search", systemImage: "magnifyingglass")}
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
