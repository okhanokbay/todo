//
//  TaskListPresenterTests.swift
//  todoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import XCTest

final class TaskListPresenterTests: XCTestCase {
  
  private var sut: TaskListPresenter!
  private var mockDisplayer: MockTaskListDisplayer!
  
  override func setUpWithError() throws {
    mockDisplayer = MockTaskListDisplayer()
    sut = TaskListPresenter(displayer: mockDisplayer)
  }
}

// MARK: presentTasks(_:) tests

extension TaskListPresenterTests {
  func test_WhenPresentTasksCalled_ThenDisplayTasksCalledWithCorrectArguments() {
    // given
    let stubbedTasks = MockTask.makeTasks(count: 2)
    let response = TaskList.FetchTasks.Response(tasks: stubbedTasks)
    let expectedViewModels = stubbedTasks.map(TaskList.TaskCellViewModel.init)
    
    // when
    sut.presentTasks(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayTasksCallCount, 1, "displayTasks(_:) is not called 1 time")
    XCTAssertEqual(mockDisplayer.displayTasksReceivedViewModel?.cellViewModels, expectedViewModels, "displayTasks(_:) is not called with correct arguments")
  }
}

// MARK: presentNewTaskAddition(_:) tests

extension TaskListPresenterTests {
  func test_WhenPresentNewTaskAdditionCalled_ThenDisplayTasksCalled() {
    // given
    let response = TaskList.AddNewTask.Response(handler: { _ in })
    
    // when
    sut.presentNewTaskAddition(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayNewTaskAdditionCallCount, 1, "displayNewTextAddition(_:) is not called 1 time")
  }
}

// MARK: presentTaskEditing(_:) tests

extension TaskListPresenterTests {
  func test_WhenPresentTaskEditingCalled_ThenDisplayTaskEditingCalledWithCorrectArguments() {
    // given
    let stubbedInitialText = "Initial text"
    let response = TaskList.EditTask.Response(initialText: stubbedInitialText, handler: { _ in })
    
    // when
    sut.presentTaskEditing(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayTaskEditingCallCount, 1, "displayTaskEditing(_:) is not called 1 time")
    XCTAssertEqual(mockDisplayer.displayTaskEditingReceivedViewModel?.initialText, stubbedInitialText, "displayTaskEditing(_:) is not called with correct arguments")
  }
}

// MARK: presentTaskDeletion(_:) tests

extension TaskListPresenterTests {
  func test_WhenPresentTaskDeletionCalled_ThenDisplayTaskDeletionCalled() {
    // given
    let stubbedTasks = MockTask.makeTasks(count: 2)
    let response = TaskList.DeleteTask.Response(tasks: stubbedTasks)
    let expectedViewModels = stubbedTasks.map(TaskList.TaskCellViewModel.init)
    
    // when
    sut.presentTaskDeletion(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayTaskDeletionCallCount, 1, "displayTasks(_:) is not called 1 time")
    XCTAssertEqual(mockDisplayer.displayTaskDeletionReceivedViewModel?.cellViewModels, expectedViewModels, "displayTasks(_:) is not called with correct arguments")
  }
}
