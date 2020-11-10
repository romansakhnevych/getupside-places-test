//
//  RSLocationService.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 08.11.2020.
//

import Bond
import CoreLocation

final class RSLocationService: NSObject, RSLocationServiceProtocol {
    
    private var locationManager = CLLocationManager()
    
    var currentLocation = Observable<CLLocation>(CLLocation())
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestCurrentLocation() {
        guard let location = locationManager.location else {
            locationManager.requestLocation()
            return
        }
        currentLocation.value = location
    }
}

extension RSLocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied || manager.authorizationStatus == .notDetermined || manager.authorizationStatus == .restricted {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            // TODO:  Throw error
            return
        }
        currentLocation.value = location
    }
}
