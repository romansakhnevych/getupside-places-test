//
//  DataController.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 10.11.2020.
//

import CoreData

final class DataController {
    
    static let main = DataController()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "getupside-places-test")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext () {
          if context.hasChanges {
              do {
                  try context.save()
              } catch {
                context.rollback()
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
    }
}
