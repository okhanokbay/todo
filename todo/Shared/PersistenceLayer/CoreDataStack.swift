//
//  PersistenceLayer.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import Foundation
import CoreData

final class CoreDataStack {
  // MARK: - Core Data stack
  
  static let shared: CoreDataStack = .init()
  
  lazy var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "todo")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error {
        self.handleError(error)
      }
    })
    return container
    
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        handleError(error)
      }
    }
  }
  
  private func handleError(_ error: Error) {
    fatalError("Unresolved error: \(error.localizedDescription)")
  }
}
