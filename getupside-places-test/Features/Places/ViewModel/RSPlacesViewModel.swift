//
//  RSPlacesViewModel.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import Bond
import GoogleMaps

final class RSPlacesViewModel: RSPlacesViewModelProtocol {
    
    // MARK: Constants
    private let defaultCameraZoom: Float = 14
    
    // MARK: Properties
    private var useCase: RSPlacesUseCaseProtocol
    
    // MARK: Output
    var camera = Observable<GMSCameraPosition>(GMSCameraPosition(latitude: 0, longitude: 0, zoom: 0))
    var places = MutableObservableArray<RSPlace>([])
    var placesMarkers = MutableObservableArray<GMSMarker>([])
    
    // MARK: Input
    func loaded() {
        useCase.loaded()
    }
    
    // MARK: Init
    init(useCase: RSPlacesUseCaseProtocol) {
        self.useCase = useCase
        bindUseCase()
    }
    
    // MARK: Binding
    private func bindUseCase() {
        _ = useCase.currentLocation.dropFirst(1).observeNext { [weak self] location in
            guard let self = self else {
                //TODO: Throw error
                return
            }
            let camera = GMSCameraPosition(target: location.coordinate, zoom: self.defaultCameraZoom)
            self.camera.value = camera
        }
        
        _ = places.bind(signal: useCase.places.toSignal())
        
        _ = useCase.places.dropFirst(1).observeNext { [weak self] places in
            guard let self = self else { return }
            let markers: [GMSMarker] = places.collection.compactMap { place in
                guard let coordinate = place.coordinate, let longLabel = place.longLabel else { return nil }
                let marker = GMSMarker()
                marker.position = coordinate
                marker.snippet = longLabel
                return marker
            }
            self.placesMarkers.replace(with: markers)
        }
    }
}


