//
//  ContentView.swift
//  Hacker News
//
//  Created by Bailey Search on 07/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Subscribe to updates from the network manager - @Published posts
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
            }
        .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
