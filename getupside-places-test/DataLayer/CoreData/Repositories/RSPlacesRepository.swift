//
//  RSPlacesRepository.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 10.11.2020.
//

import CoreData

final class RSPlacesRepository {
    
    private let savedLocalyKey = "savedLocaly"
    
    private var dataController: DataController
    
    var isSavedLocaly: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: savedLocalyKey)
        }
        
        get {
           return UserDefaults.standard.bool(forKey: savedLocalyKey)
        }
    }
    
    init (dataController: DataController = DataController.main){
        self.dataController = dataController
    }
    
   
    func save(_ places: [RSPlace]) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: PlaceEntity.self), in: dataController.context) else { return }
        let _: [PlaceEntity] = places.map { PlaceEntity(place: $0, entity: entityDescription, context: dataController.context )}
        dataController.saveContext()
        isSavedLocaly = true
    }
    
    func fetchAll() -> [RSPlace] {
        let fetchRequest:NSFetchRequest<PlaceEntity> = PlaceEntity.fetchRequest()
        guard let placesEntities = try? dataController.context.fetch(fetchRequest) else {
            return []
        }
        let places: [RSPlace] = placesEntities.map { RSPlace(placeEntity: $0)}
        return places
    }
    
    func deleteAll() {
        let fetchRequest:NSFetchRequest<PlaceEntity> = PlaceEntity.fetchRequest()
        guard let placesEntities = try? dataController.context.fetch(fetchRequest) else {
            return
        }
        
        placesEntities.forEach { dataController.context.delete($0) }
        dataController.saveContext()
        isSavedLocaly = false
    }
}
