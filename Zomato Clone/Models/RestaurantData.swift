//
//  RestrauntData.swift
//  Zomato Clone
//
//  Created by Shivam Kejriwal on 01/08/20.
//  Copyright © 2020 Shivam Kejriwal. All rights reserved.
//

import Foundation

struct Results : Decodable {
    let restaurants : [Type1]
}

struct Type1 : Decodable{
    let restaurant : restaurant
}

struct restaurant : Decodable,Identifiable {
    let id : String
    let name : String
    let url : String
    let thumb : String
    let user_rating : Type2
}

struct Type2 : Decodable {
    let aggregate_rating : String
}
