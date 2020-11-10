//
//  RSPlacesRoutes.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import Foundation

enum RSPlacesRoutes: NavigationRoutes {
    case placesDetails
    
    var storyboardName: String {
        return "Places"
    }
    
    var destinationViewControllerIdentifier: String {
       return "RSPlaceDetailsViewController"
    }
}
