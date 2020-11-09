//
//  RSPlacesUseCaseProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import Bond
import CoreLocation

protocol RSPlacesUseCaseProtocol {
    
    // Output
    var currentLocation: Observable<CLLocation> { get }
    
    // Input
    func loaded()
}
