//
//  PersistenceLayer.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import Foundation

protocol PersistenceLayer: AnyObject {
  func fetch() -> [Task]
  func save(text: String)
  func update(task: Task, with text: String)
  func delete(task: Task)
}
