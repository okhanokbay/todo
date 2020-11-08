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

extension TaskList.TaskCellViewModel: Equatable {
  public static func == (lhs: TaskList.TaskCellViewModel, rhs: TaskList.TaskCellViewModel) -> Bool {
    return lhs.labelText == rhs.labelText
  }
}
