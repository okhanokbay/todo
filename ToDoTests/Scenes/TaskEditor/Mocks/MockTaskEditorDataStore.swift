//
//  MockTaskEditorDataStore.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskEditorDataStore: TaskEditorDataStoreProtocol {
  var initialText: String?
  var taskEditorOperationDidEnd: TextHandler?
}
