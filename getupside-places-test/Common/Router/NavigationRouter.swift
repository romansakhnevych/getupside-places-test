//
//  Router.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import UIKit

protocol NavigationRouter {
    func route(to route: NavigationRoutes, from context: UIViewController, with params: Any?)
}
