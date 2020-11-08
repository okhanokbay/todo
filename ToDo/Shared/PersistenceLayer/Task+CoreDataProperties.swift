//
//  Task+CoreDataProperties.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//
//

import Foundation
import CoreData

extension Task {
  @nonobjc public class func createFetchRequest() -> NSFetchRequest<Task> {
    return NSFetchRequest<Task>(entityName: "Task")
  }
  
  @NSManaged public var taskDescription: String
  @NSManaged public var recordDate: Date
}
