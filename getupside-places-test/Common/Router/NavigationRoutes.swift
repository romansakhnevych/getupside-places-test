//
//  Route.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import Foundation

protocol NavigationRoutes {
    var storyboardName: String { get }
    var destinationViewControllerIdentifier: String { get }
}
