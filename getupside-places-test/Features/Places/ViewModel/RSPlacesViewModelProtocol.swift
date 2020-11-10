//
//  RSPlacesViewModelProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import Bond
import GoogleMaps

protocol RSPlacesViewModelProtocol: GMSMapViewDelegate, UITableViewDelegate {
    
    // Output
    var camera: Observable<GMSCameraPosition> { get }
    var places: MutableObservableArray<RSPlace> { get }
    var placesMarkers: MutableObservableArray<GMSMarker> { get }
    var selectedPlace: Observable<RSPlace> { get }
    var shouldShowSpinner: Observable<Bool> { get }
    
    // Input
    func loaded()

}
