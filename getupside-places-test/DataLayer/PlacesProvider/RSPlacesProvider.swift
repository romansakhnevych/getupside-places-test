//
//  RSPlacesProvider.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation

final class RSPlacesProvider: RSPlacesProviderProtocol {
    
    var placesApiProvider: RSPlacesProviderProtocol = RSPlacesApiProvider()
    var placesCoreDataProvider: RSPlacesProviderProtocol = RSPlacesCoreDataProvider()
    
    var isStored: Bool = false
    
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping (() -> Void)) {
        if isStored {
            placesCoreDataProvider.places(near: coordinates, completion: completion)
        } else {
            placesApiProvider.places(near: coordinates, completion: completion)
        }
    }
    
    
}
