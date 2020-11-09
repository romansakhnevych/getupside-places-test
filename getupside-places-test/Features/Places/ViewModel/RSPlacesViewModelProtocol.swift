//
//  RSPlacesViewModelProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import Bond
import GoogleMaps

protocol RSPlacesViewModelProtocol {
    
    // Output
    var camera: Observable<GMSCameraPosition> { get }
    var places: MutableObservableArray<RSPlace> { get }
    var placesMarkers: MutableObservableArray<GMSMarker> { get }
    
    // Input
    func loaded()

}
