//
//  NetworkManager.swift
//  Zomato Clone
//
//  Created by Shivam Kejriwal on 01/08/20.
//  Copyright © 2020 Shivam Kejriwal. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class NetworkManager: ObservableObject {
    
    let didChange = PassthroughSubject<NetworkManager, Never>()

    @Published var restaurants : [restaurant] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var search: String = ""
    
//    search: String = ""
    
    func fetchData() {
        
        var url1 = "https://developers.zomato.com/api/v2.1/search?lat=19.100739&lon=72.848495"
        let api_key = "1b3c8b37ea96785391fa55c288ac385c"
        
        if search != "" {
            url1 = url1 + "&q=" + search.replacingOccurrences(of: " ", with: "%20")
            print(url1)
        }
        
        if let url = URL(string: url1){
            var request = URLRequest(url: url)
            
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(api_key, forHTTPHeaderField: "user-key")
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request){data,response,error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.restaurants = []
                                for i in results.restaurants{
                                    self.restaurants.append(restaurant(id: i.restaurant.id, name: i.restaurant.name, url: i.restaurant.url, thumb: i.restaurant.thumb, user_rating: i.restaurant.user_rating))
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

