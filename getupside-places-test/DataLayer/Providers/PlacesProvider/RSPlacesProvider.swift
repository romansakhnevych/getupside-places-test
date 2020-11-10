//
//  RSPlacesProvider.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation

final class RSPlacesProvider: RSPlacesProviderProtocol {
    
    var placesApiProvider: RSPlacesProviderProtocol
    var placesCoreDataProvider: RSPlacesProviderProtocol
    
    var repository: RSPlacesRepository
    
    init(repository: RSPlacesRepository = RSPlacesRepository()) {
        self.repository = repository
        self.placesApiProvider = RSPlacesApiProvider(repository: repository)
        self.placesCoreDataProvider = RSPlacesCoreDataProvider(repository: repository)
    }
    
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping RSPlacesProviderCompletion) {
         if repository.isSavedLocaly {
            placesCoreDataProvider.places(near: coordinates, completion: completion)
        } else {
            placesApiProvider.places(near: coordinates, completion: completion)
        }
    }
    
    
}
