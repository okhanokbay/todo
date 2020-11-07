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
  // Not using a lazy container since we need the stack as early as possible after the app launch
  
  static let shared: CoreDataStack = .init(container: .init(name: "todo"))
  
  let container: NSPersistentContainer
  
  init(container: NSPersistentContainer) {
    self.container = container
    
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error {
        self.handleError(error)
      }
    })
  }
}

// MARK: - Core Data Saving support

extension CoreDataStack {
  func saveContext () {
    let context = container.viewContext
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

extension CoreDataStack {
  func fetchTasks() -> [Task] {
    let request = Task.createFetchRequest()
    return (try? container.viewContext.fetch(request)) ?? []
  }
  
  func saveTask(description: String) {
    let task = Task(context: container.viewContext)
    task.taskDescription = description
    saveContext()
  }
  
  func update(task: Task, with description: String) {
    task.taskDescription = description
    saveContext()
  }
  
  func delete(task: Task) {
    container.viewContext.delete(task)
    saveContext()
  }
}
