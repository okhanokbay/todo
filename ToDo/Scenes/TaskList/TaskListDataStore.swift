//
//  TaskListDataStore.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import Foundation

protocol TaskListDataStoreProtocol: AnyObject {
  var tasks: [Task] { get set }
  var editingTask: Task? { get set }
}

final class TaskListDataStore: TaskListDataStoreProtocol {
  var tasks: [Task] = []
  var editingTask: Task?
}
