//
//  RSLocationServiceProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 08.11.2020.
//

import Bond
import CoreLocation

protocol RSLocationServiceProtocol {
    var currentLocation: Observable<CLLocation> { get }
    func requestCurrentLocation()
}
