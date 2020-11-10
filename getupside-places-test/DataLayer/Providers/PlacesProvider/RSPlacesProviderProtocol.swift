//
//  RSPlacesProviderProtocol.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation

typealias RSPlacesProviderCompletion = ((Result<[RSPlace], Error>) -> Void)

protocol RSPlacesProviderProtocol {
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping RSPlacesProviderCompletion)
}
