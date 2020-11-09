//
//  RSPlacesUseCase.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import CoreLocation
import Bond

final class RSPlacesUseCase: RSPlacesUseCaseProtocol {
    
    // MARK: Private properties
    private var locationService: RSLocationServiceProtocol
    private var placesProvider: RSPlacesProviderProtocol
    
    //MARK: Output
    var currentLocation = Observable<CLLocation>(CLLocation())
    var places = MutableObservableArray<RSPlace>([])
    
    // MARK: Input
    func loaded() {
        locationService.requestCurrentLocation()
    }
    
    // MARK: Init
    init(locationService: RSLocationServiceProtocol = RSLocationService(), placesProvider: RSPlacesProviderProtocol = RSPlacesProvider()) {
        self.locationService = locationService
        self.placesProvider = placesProvider
        bindLocationService()
    }
    
}

// MARK: Binding
private extension RSPlacesUseCase {
    private func bindLocationService() {
        _ = locationService.currentLocation.dropFirst(1).observeNext { [weak self] location in
            guard let self = self else { return }
            self.currentLocation.value = location
            self.requestPlacesNearby(coordinates: location.coordinate)
        }
    }
}

// MARK: Places
private extension RSPlacesUseCase {
    func requestPlacesNearby(coordinates: CLLocationCoordinate2D) {
        placesProvider.places(near: coordinates) { [weak self] result in
            guard let self = self else {
                //TODO: Throw error
                return
            }
            switch result {
            case .success(let places): self.places.replace(with: places)
            case .failure(let error): print(error) // TODO: Throw error
            }
        }
    }
}




