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
    
    // Input
    func loaded()

}
