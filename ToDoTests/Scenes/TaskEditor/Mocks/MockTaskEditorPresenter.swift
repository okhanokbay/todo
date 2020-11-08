//
//  MockTaskEditorPresenter.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo

import Foundation

final class MockTaskEditorPresenter: TaskEditorPresentationLogic {
  var presentInitialsCallCount = 0
  var presentInitialsReceivedResponse: TaskEditor.SetupInitials.Response?
  
  func presentInitials(response: TaskEditor.SetupInitials.Response) {
    presentInitialsCallCount += 1
    presentInitialsReceivedResponse = response
  }
  
  var presentEntryCompletionCallCount = 0
  var presentEntryCompletionReceivedResponse: TaskEditor.CompleteEntry.Response?
  
  func presentEntryCompletion(response: TaskEditor.CompleteEntry.Response) {
    presentEntryCompletionCallCount += 1
    presentEntryCompletionReceivedResponse = response
  }
}
