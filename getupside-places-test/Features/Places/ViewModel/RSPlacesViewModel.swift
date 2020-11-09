//
//  RSPlacesViewModel.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import Bond
import GoogleMaps

final class RSPlacesViewModel: RSPlacesViewModelProtocol {
    
    private let defaultCameraZoom: Float = 14
    
    private var useCase: RSPlacesUseCaseProtocol
    
    //MARK: Output
    var camera = Observable<GMSCameraPosition>(GMSCameraPosition(latitude: 0, longitude: 0, zoom: 0))
    
    //MARK: Input
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
    }
}
