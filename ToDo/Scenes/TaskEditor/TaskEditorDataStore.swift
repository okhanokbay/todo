//
//  TaskEditorDataStore.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import Foundation

protocol TaskEditorDataStoreProtocol: AnyObject {
  var initialText: String? { get set }
  var taskEditorOperationDidEnd: TextHandler? { get set }
}

final class TaskEditorDataStore: TaskEditorDataStoreProtocol {
  var initialText: String?
  var taskEditorOperationDidEnd: TextHandler?
}
