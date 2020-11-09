//
//  RSPlace.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import CoreLocation

struct RSPlace {
    
    var shortLabel: String?
    var shortAddress: String?
    var city: String?
    var coordinate: CLLocationCoordinate2D?
    var postal: String?
    var region: String?
    var placeName: String?
    var url: String?
    var longLabel: String?
    var placeType: String?
    var zone: String?
    var country: String?
    var streetType: String?
    var streetName: String?
    var buildingNumber: String?
    
    init(from dictionary: [String: Any]) {
        self.shortLabel = dictionary[MappingKeys.ShortLabel.rawValue] as? String
        self.shortAddress = dictionary[MappingKeys.Place_addr.rawValue] as? String
        self.city = dictionary[MappingKeys.City.rawValue] as? String
        if let latitude = dictionary[MappingKeys.Y.rawValue] as? Double, let longitude = dictionary[MappingKeys.X.rawValue] as? Double {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        self.postal = dictionary[MappingKeys.Postal.rawValue] as? String
        self.region = dictionary[MappingKeys.Region.rawValue] as? String
        self.placeName = dictionary[MappingKeys.PlaceName.rawValue] as? String
        self.url = dictionary[MappingKeys.URL.rawValue] as? String
        self.longLabel = dictionary[MappingKeys.LongLabel.rawValue] as? String
        self.placeType = dictionary[MappingKeys.PlcaseType.rawValue] as? String
        self.zone = dictionary[MappingKeys.Zone.rawValue] as? String
        self.country = dictionary[MappingKeys.Country.rawValue] as? String
        self.streetType = dictionary[MappingKeys.StType.rawValue] as? String
        self.streetName = dictionary[MappingKeys.StName.rawValue] as? String
        self.buildingNumber = dictionary[MappingKeys.AddNum.rawValue] as? String
    }
}


// MARK: Mapping Keys
private extension RSPlace {
    enum MappingKeys: String {
        case ShortLabel, Place_addr, City, X, Postal, Region, PlaceName, URL, LongLabel, PlcaseType = "Type", Y, Zone, Country, StType, StName, AddNum
    }
}
