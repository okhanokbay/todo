//
//  MockTaskListInteractor.swift
//  ToDoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import Foundation

final class MockTaskListInteractor: TaskListBusinessLogic {
  var fetchTasksCallCount = 0
  var fetchTasksReceivedRequest: TaskList.FetchTasks.Request?
  
  func fetchTasks(request: TaskList.FetchTasks.Request) {
    fetchTasksCallCount += 1
    fetchTasksReceivedRequest = request
  }
  
  var addNewTaskCallCount = 0
  var addNewTaskReceivedRequest: TaskList.AddNewTask.Request?
  
  func addNewTask(request: TaskList.AddNewTask.Request) {
    addNewTaskCallCount += 1
    addNewTaskReceivedRequest = request
  }
  
  var editTaskCallCount = 0
  var editTaskReceivedRequest: TaskList.EditTask.Request?
  
  func editTask(request: TaskList.EditTask.Request) {
    editTaskCallCount += 1
    editTaskReceivedRequest = request
  }
  
  var deleteTaskCallCount = 0
  var deleteTaskReceivedRequest: TaskList.DeleteTask.Request?
  
  func deleteTask(request: TaskList.DeleteTask.Request) {
    deleteTaskCallCount += 1
    deleteTaskReceivedRequest = request
  }
}
