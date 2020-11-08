//
//  TaskListDataStore.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import Foundation

protocol TaskListDataStoreProtocol: AnyObject {
  var tasks: [TaskObject] { get set }
  var editingTask: TaskObject? { get set }
}

final class TaskListDataStore: TaskListDataStoreProtocol {
  var tasks: [TaskObject] = []
  var editingTask: TaskObject?
}
