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
  
  var displayNewTaskAdditionCallCount = 0
  var displayNewTaskAdditionReceivedViewModel: TaskList.AddNewTask.ViewModel?
  
  func displayNewTaskAddition(viewModel: TaskList.AddNewTask.ViewModel) {
    displayNewTaskAdditionCallCount += 1
    displayNewTaskAdditionReceivedViewModel = viewModel
  }
  
  var displayTaskEditingCallCount = 0
  var displayTaskEditingReceivedViewModel: TaskList.EditTask.ViewModel?
  
  func displayTaskEditing(viewModel: TaskList.EditTask.ViewModel) {
    displayTaskEditingCallCount += 1
    displayTaskEditingReceivedViewModel = viewModel
  }
  
  var displayTaskDeletionCallCount = 0
  var displayTaskDeletionReceivedViewModel: TaskList.DeleteTask.ViewModel?
  
  func displayTaskDeletion(viewModel: TaskList.DeleteTask.ViewModel) {
    displayTaskDeletionCallCount += 1
    displayTaskDeletionReceivedViewModel = viewModel
  }
}
