//
//  Task+CoreDataProperties.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//
//

import Foundation
import CoreData

extension Task {
  @nonobjc public class func createFetchRequest() -> NSFetchRequest<Task> {
    return NSFetchRequest<Task>(entityName: "Task")
  }
  
  @NSManaged public var taskDescription: String
}
