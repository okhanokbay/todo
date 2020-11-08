//
//  MockTaskListDataStore.swift
//  todoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskListDataStore: TaskListDataStoreProtocol {
  var tasks: [TaskObject] = []
  var editingTask: TaskObject?
}
