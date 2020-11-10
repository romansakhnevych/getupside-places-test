//
//  AppDelegate.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerGoogleApiKey()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

//MARK: Google API key
private extension AppDelegate {
    func registerGoogleApiKey() {
        GMSServices.provideAPIKey("AIzaSyCByB19VEOEWrkA0N0lP6tOLVzqoifv2FM")
    }
}
