//
//  MockTaskEditorInteractor.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskEditorInteractor: TaskEditorBusinessLogic {
  var setupInitialsCallCount = 0
  var setupInitialsReceivedRequest: TaskEditor.SetupInitials.Request?
  
  func setupInitials(request: TaskEditor.SetupInitials.Request) {
    setupInitialsCallCount += 1
    setupInitialsReceivedRequest = request
  }
  
  var completeEntryCallCount = 0
  var completeEntryReceivedRequest: TaskEditor.CompleteEntry.Request?
  
  func completeEntry(request: TaskEditor.CompleteEntry.Request) {
    completeEntryCallCount += 1
    completeEntryReceivedRequest = request
  }
}
