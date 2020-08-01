//
//  ContentView.swift
//  Zomato Clone
//
//  Created by Shivam Kejriwal on 01/08/20.
//  Copyright © 2020 Shivam Kejriwal. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit
import Combine

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
//    @State private var searchText : String = ""
    
    
    var body: some View {
        
        VStack {
            SearchBar(text: $networkManager.search,onCommit: networkManager.fetchData)
            NavigationView {
                List{
                    ForEach(networkManager.restaurants){ i in
                        NavigationLink(destination: DetailView(url: i.url, name: i.name)) {
                            HStack{
                                AnimatedImage(url: URL(string: i.thumb)).resizable().frame(width: 100, height: 100).cornerRadius(10)
                                VStack(alignment: .leading) {
                                    
                                    Text(i.name).fontWeight(.heavy)
                                    Text(i.user_rating.aggregate_rating)
                                }.padding(.vertical, 10)
                                
                            }
                        }
                    }
                    }
                .navigationBarTitle("Near By Restaurants")
                }
            .onAppear{
                self.networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var restaurants = [restaurant]()
