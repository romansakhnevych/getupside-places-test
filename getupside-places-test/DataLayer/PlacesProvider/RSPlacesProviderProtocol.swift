//
//  RSPlacesProviderProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation

protocol RSPlacesProviderProtocol {
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping (() -> Void))
}
