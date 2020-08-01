//
//  LocationManager.swift
//  Zomato Clone
//
//  Created by Shivam Kejriwal on 02/08/20.
//  Copyright © 2020 Shivam Kejriwal. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject,CLLocationManagerDelegate ,ObservableObject{
    
    let locationManager = CLLocationManager()
    
    @Published var lat: CLLocationDegrees? = 19.100739
    @Published var lon: CLLocationDegrees? = 72.848495
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
