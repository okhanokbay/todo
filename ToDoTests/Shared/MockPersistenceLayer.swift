//
//  MockPersistenceLayer.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation
import CoreData

final class MockTask: TaskObject {
  var taskDescription: String
  var recordDate: Date
  
  init(taskDescription: String,
       recordDate: Date) {
    
    self.taskDescription = taskDescription
    self.recordDate = recordDate
  }
}

final class MockPersistenceLayer: PersistenceLayer {
  var fetchCallCount = 0
  
  func fetch() -> [TaskObject] {
    fetchCallCount += 1
    
    return (0..<10).map { MockTask(taskDescription: "Task\($0)", recordDate: Date()) }
  }
  
  var saveCallCount = 0
  var saveReceivedText: String?
  
  func save(text: String) {
    saveCallCount += 1
    saveReceivedText = text
  }
  
  var updateCallCount = 0
  var updateReceivedTask: TaskObject?
  var updateReceivedText: String?
  
  func update(task: TaskObject, with text: String) {
    updateCallCount += 1
    updateReceivedTask = task
    updateReceivedText = text
  }
  
  var deleteCallCount = 0
  var deleteReceivedTask: TaskObject?
  
  func delete(task: TaskObject) {
    deleteCallCount += 1
    deleteReceivedTask = task
  }
}

