//
//  RSPlacesApiProviderd.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 07.11.2020.
//

import CoreLocation
import ArcGIS

final class RSPlacesApiProvider: RSPlacesProviderProtocol {
    private let locatorTaskServiceUrl = URL(string: "https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer")
    
    private lazy var locatorTask: AGSLocatorTask? = {
        guard let serviceUrl = locatorTaskServiceUrl else { return nil }
        return AGSLocatorTask(url: serviceUrl)
    }()
    
    private var currentSearch: AGSCancelable?
    
    /// Provide places from ArcGIS service
    func places(near coordinates: CLLocationCoordinate2D, completion: @escaping RSPlacesProviderCompletion) {
        guard let locatorTask = locatorTask else {
            //TODO: throw error
            return
        }
        currentSearch?.cancel()
        
        let parameters = AGSGeocodeParameters()
        parameters.preferredSearchLocation = AGSPoint(clLocationCoordinate2D: coordinates)
        parameters.maxResults = 20
        parameters.categories = ["Food"]
        parameters.resultAttributeNames.append("*")
        
        currentSearch = locatorTask.geocode(withSearchText: "", parameters: parameters) { result, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let result = result else {
                //TODO: Throw error
                return
            }
            
            var places = [RSPlace]()
            
            result.forEach { resultItem in
                if let attributes = resultItem.attributes {
                    let place = RSPlace(from: attributes)
                    places.append(place)
                }
            }
            
            completion(.success(places))
        }
    }
}
