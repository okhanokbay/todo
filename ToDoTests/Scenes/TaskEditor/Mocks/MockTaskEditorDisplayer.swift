//
//  MockTaskEditorDisplayer.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskEditorDisplayer: TaskEditorDisplayLogic {
  var displayInitialsCallCount = 0
  var displayInitialsReceivedViewModel: TaskEditor.SetupInitials.ViewModel?
  
  func displayInitials(viewModel: TaskEditor.SetupInitials.ViewModel) {
    displayInitialsCallCount += 1
    displayInitialsReceivedViewModel = viewModel
  }
  
  var displayEntryCompletionCallCount = 0
  var displayEntryCompletionReceivedViewModel: TaskEditor.CompleteEntry.ViewModel?
  
  func displayEntryCompletion(viewModel: TaskEditor.CompleteEntry.ViewModel) {
    displayEntryCompletionCallCount += 1
    displayEntryCompletionReceivedViewModel = viewModel
  }
}
