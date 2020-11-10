//
//  PlaceEntity+CoreDataProperties.swift
//  
//
//  Created by Roman Sakhnevych on 10.11.2020.
//
//

import Foundation
import CoreData

@objc(PlaceEntity)
public class PlaceEntity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlaceEntity> {
        return NSFetchRequest<PlaceEntity>(entityName: "PlaceEntity")
    }

    @NSManaged public var buildingNumber: String?
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var distance: Double
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var longLabel: String?
    @NSManaged public var placeName: String?
    @NSManaged public var placeType: String?
    @NSManaged public var postal: String?
    @NSManaged public var region: String?
    @NSManaged public var shortAddress: String?
    @NSManaged public var shortLabel: String?
    @NSManaged public var streetName: String?
    @NSManaged public var streetType: String?
    @NSManaged public var url: String?
    @NSManaged public var zoneType: String?
    
    convenience init(place: RSPlace, entity: NSEntityDescription, context: NSManagedObjectContext) {
        self.init(entity: entity, insertInto: context)
        self.buildingNumber = place.buildingNumber
        self.city = place.city
        self.country = place.country
        self.latitude = place.coordinate?.latitude ?? 0
        self.longitude = place.coordinate?.longitude ?? 0
        self.longLabel = place.longLabel
        self.placeName = place.placeName
        self.placeType = place.placeType
        self.postal = place.postal
        self.region = place.region
        self.shortAddress = place.shortAddress
        self.streetName = place.streetName
        self.streetType = place.streetType
        self.url = place.url
        self.zoneType = place.zone
    }
}


