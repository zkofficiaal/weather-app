//
//  LocationManager.swift
//  WeatherDemo
//
//  Created by Z.K   on 15/06/2026.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isloading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
         isloading = true
         manager .requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isloading = false
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("error getting location", error)
        isloading = false
    }
}
