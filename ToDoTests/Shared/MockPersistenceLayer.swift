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
  
  static func makeTasks(count: Int) -> [MockTask] {
    (0..<count).map { MockTask(taskDescription: "Task\($0)", recordDate: Date()) }
  }
}

extension MockTask: Equatable {
  static func == (lhs: MockTask, rhs: MockTask) -> Bool {
    return lhs.taskDescription == rhs.taskDescription
  }
}

final class MockPersistenceLayer: PersistenceLayer {
  var currentTasks: [TaskObject] = []
  
  var fetchCallCount = 0
  
  func fetch() -> [TaskObject] {
    fetchCallCount += 1
    return currentTasks
  }
  
  var saveCallCount = 0
  var saveReceivedText: String?
  
  func save(text: String) {
    saveCallCount += 1
    saveReceivedText = text
    currentTasks.append(MockTask(taskDescription: text, recordDate: Date()))
  }
  
  var updateCallCount = 0
  var updateReceivedTask: TaskObject?
  var updateReceivedText: String?
  
  func update(task: TaskObject, with text: String) {
    updateCallCount += 1
    updateReceivedTask = task
    updateReceivedText = text

    if let index = currentTasks.firstIndex(where: { $0.recordDate == task.recordDate }) {
      currentTasks[index] = MockTask(taskDescription: text, recordDate: Date())
    }
  }
  
  var deleteCallCount = 0
  var deleteReceivedTask: TaskObject?
  
  func delete(task: TaskObject) {
    deleteCallCount += 1
    deleteReceivedTask = task

    currentTasks.removeAll(where: { $0.recordDate == task.recordDate })
  }
}

