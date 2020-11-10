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
    
    init() {
        self.shortLabel = nil
        self.shortAddress = nil
        self.city = nil
        self.coordinate = nil
        self.postal = nil
        self.region = nil
        self.placeName = nil
        self.url = nil
        self.longLabel = nil
        self.placeType = nil
        self.zone = nil
        self.country = nil
        self.streetType = nil
        self.streetName = nil
        self.buildingNumber = nil
    }
    
    init(placeEntity: PlaceEntity) {
        self.buildingNumber = placeEntity.buildingNumber
        self.city = placeEntity.city
        self.country = placeEntity.country
        if placeEntity.latitude != 0 && placeEntity.longitude != 0 {
            self.coordinate = CLLocationCoordinate2D(latitude: placeEntity.latitude, longitude: placeEntity.longitude)
        }
        self.longLabel = placeEntity.longLabel
        self.placeName = placeEntity.placeName
        self.placeType = placeEntity.placeType
        self.postal = placeEntity.postal
        self.region = placeEntity.region
        self.shortAddress = placeEntity.shortAddress
        self.streetName = placeEntity.streetName
        self.streetType = placeEntity.streetType
        self.url = placeEntity.url
        self.zone = placeEntity.zoneType
    }
    
}


// MARK: Mapping Keys
private extension RSPlace {
    enum MappingKeys: String {
        case ShortLabel, Place_addr, City, X, Postal, Region, PlaceName, URL, LongLabel, PlcaseType = "Type", Y, Zone, Country, StType, StName, AddNum
    }
}
