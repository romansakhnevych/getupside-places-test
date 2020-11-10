//
//  RSPlacesRouter.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import UIKit

final class RSPlacesRouter: NavigationRouter {
    func route(to route: NavigationRoutes, from context: UIViewController, with params: Any?) {
        guard let route = route as? RSPlacesRoutes else { return }
        let storyboard = UIStoryboard(name: route.storyboardName, bundle: Bundle.main)
        switch route {
        case .placesDetails:
            if let desctinationViewController = storyboard.instantiateViewController(identifier: route.destinationViewControllerIdentifier) as? RSPlaceDetailsViewController {
                desctinationViewController.place = params as? RSPlace
                context.navigationController?.pushViewController(desctinationViewController, animated: true)
            }
        }
        
    }
}
