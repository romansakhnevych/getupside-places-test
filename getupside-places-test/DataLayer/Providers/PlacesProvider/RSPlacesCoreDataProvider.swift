//
//  RSPlacesCoreDataProvider.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation

final class RSPlacesCoreDataProvider: RSPlacesProviderProtocol {
    
    private var repository: RSPlacesRepository
    
    init(repository: RSPlacesRepository) {
        self.repository = repository
    }
    
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping RSPlacesProviderCompletion) {
        DispatchQueue.global().async { [weak self] in
            guard let places = self?.repository.fetchAll() else {
                //TODO: Throw error
                return
            }
            DispatchQueue.main.async {
                completion(.success(places))
            }
        }
    }
}
