//
//  MockTaskListPresenter.swift
//  todoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskListPresenter: TaskListPresentationLogic {
  var presentTasksCallCount = 0
  var presentTasksReceivedResponse: TaskList.FetchTasks.Response?
  
  func presentTasks(response: TaskList.FetchTasks.Response) {
    presentTasksCallCount += 1
    presentTasksReceivedResponse = response
  }
  
  var presentNewTaskAdditionCallCount = 0
  var presentNewTaskAdditionReceivedResponse: TaskList.AddNewTask.Response?
  
  func presentNewTaskAddition(response: TaskList.AddNewTask.Response) {
    presentNewTaskAdditionCallCount += 1
    presentNewTaskAdditionReceivedResponse = response
  }
  
  var presentTaskEditingCallCount = 0
  var presentTaskEditingReceivedResponse: TaskList.EditTask.Response?
  
  func presentTaskEditing(response: TaskList.EditTask.Response) {
    presentTaskEditingCallCount += 1
    presentTaskEditingReceivedResponse = response
  }
  
  var presentTaskDeletionCallCount = 0
  var presentTaskDeletionReceivedResponse: TaskList.DeleteTask.Response?
  
  func presentTaskDeletion(response: TaskList.DeleteTask.Response) {
    presentTaskDeletionCallCount += 1
    presentTaskDeletionReceivedResponse = response
  }
}

