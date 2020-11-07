//
//  MockTaskListDisplayer.swift
//  todoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskListDisplayer: TaskListDisplayLogic {
  var displayTasksCallCount = 0
  var displayTasksReceivedViewModel: TaskList.FetchTasks.ViewModel?
  
  func displayTasks(viewModel: TaskList.FetchTasks.ViewModel) {
    displayTasksCallCount += 1
    displayTasksReceivedViewModel = viewModel
  }
  
  var displayNewTextAdditionCallCount = 0
  var displayNewTextAdditionReceivedViewModel: TaskList.AddNewTask.ViewModel?
  
  func displayNewTaskAddition(viewModel: TaskList.AddNewTask.ViewModel) {
    displayNewTextAdditionCallCount += 1
    displayNewTextAdditionReceivedViewModel = viewModel
  }
  
  var displayTextEditingCallCount = 0
  var displayTextEditingReceivedViewModel: TaskList.EditTask.ViewModel?
  
  func displayTaskEditing(viewModel: TaskList.EditTask.ViewModel) {
    displayTextEditingCallCount += 1
    displayTextEditingReceivedViewModel = viewModel
  }
  
  var displayTextDeletionCallCount = 0
  var displayTaskDeletionReceivedViewModel: TaskList.DeleteTask.ViewModel?
  
  func displayTaskDeletion(viewModel: TaskList.DeleteTask.ViewModel) {
    displayTextDeletionCallCount += 1
    displayTaskDeletionReceivedViewModel = viewModel
  }
}
