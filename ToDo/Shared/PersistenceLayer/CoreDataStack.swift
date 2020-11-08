//
//  PersistenceLayer.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import Foundation
import CoreData

// MARK: - Core Data stack

final class CoreDataStack {
  static let shared: CoreDataStack = .init()

  var injectedContainer: NSPersistentContainer?
  
  lazy var persistentContainer: NSPersistentContainer = {
    if let injectedContainer = injectedContainer {
      return injectedContainer
    }
    
    let container: NSPersistentContainer = .init(name: "todo")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error {
        self.handleError(error)
      }
    })
    return container
  }()
}

// MARK: - Core Data Saving support

extension CoreDataStack {
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

// MARK: Core Data Helper Methods

extension CoreDataStack: PersistenceLayer {
  func fetch() -> [Task] {
    let request = Task.createFetchRequest()
    return (try? persistentContainer.viewContext.fetch(request)) ?? []
  }
  
  func save(text: String) {
    let task = Task(context: persistentContainer.viewContext)
    task.taskDescription = text
  }
  
  func update(task: Task, with text: String) {
    task.taskDescription = text
  }
  
  func delete(task: Task) {
    persistentContainer.viewContext.delete(task)
  }
}
