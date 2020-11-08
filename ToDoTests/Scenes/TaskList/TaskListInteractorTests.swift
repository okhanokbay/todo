//
//  TaskListInteractorTests.swift
//  todoTests
//
//  Created by Okhan Okbay on 8.11.2020.
//

@testable import ToDo
import XCTest

final class TaskListInteractorTests: XCTestCase {
  
  private var sut: TaskListInteractor!
  private var mockPersistenceLayer: MockPersistenceLayer!
  private var mockDataStore: MockTaskListDataStore!
  private var mockPresenter: MockTaskListPresenter!
  
  override func setUpWithError() throws {
    mockPersistenceLayer = MockPersistenceLayer()
    mockDataStore = MockTaskListDataStore()
    mockPresenter = MockTaskListPresenter()
    
    sut = TaskListInteractor(persistenceLayer: mockPersistenceLayer,
                             dataStore: mockDataStore,
                             presenter: mockPresenter)
  }
}

// MARK: Fetch Tasks Tests

extension TaskListInteractorTests {
  func test_WhenFetchTasksCalled_ThenPresenterCalledWithCorrectArguments() {
    // given
    let expectedTaskCount = 2
    let expectedTasks = MockTask.makeTasks(count: expectedTaskCount)
    let request: TaskList.FetchTasks.Request = .init()
    
    // when
    mockPersistenceLayer.currentTasks = MockTask.makeTasks(count: expectedTaskCount)
    sut.fetchTasks(request: request)
    
    // then
    XCTAssertEqual(mockPersistenceLayer.fetchCallCount, 1, "fetchCallCount() is not called 1 time")
    XCTAssertEqual(mockDataStore.tasks as? [MockTask], expectedTasks, "mockDataStore does not have correct tasks")
    XCTAssertEqual(mockPresenter.presentTasksReceivedResponse?.tasks as? [MockTask], expectedTasks, "presentTasks(_:) is not called with correct arguments")
  }
}

// MARK: Add New Task Tests

extension TaskListInteractorTests {
  func test_WhenAddNewTaskCalled_ThenPresentNewTaskCalled() {
    // given
    let request: TaskList.AddNewTask.Request = .init()
    
    // when
    sut.addNewTask(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentNewTaskAdditionCallCount, 1, "presentNewTaskAddition(_:) is not called 1 time")
  }
}

// MARK: Edit Task Tests

extension TaskListInteractorTests {
  func test_WhenEditTaskCalled_ThenPresentTaskEditingCalledWithCorrectArguments() {
    // given
    let index = 0
    let expectedInitialText = "Task\(index)"
    let request: TaskList.EditTask.Request = .init(index: index)
    let stubbedTasks = MockTask.makeTasks(count: index + 1)
    
    // when
    mockDataStore.tasks = stubbedTasks
    mockPersistenceLayer.currentTasks = stubbedTasks
    sut.editTask(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentTaskEditingCallCount, 1, "presentTaskEditing(_:) is not called 1 time")
    XCTAssertEqual(mockPresenter.presentTaskEditingReceivedResponse?.initialText, expectedInitialText, "presentTaskEditing(_:) is not called with correct arguments")
  }
}

// MARK: Delete Task Tests

extension TaskListInteractorTests {
  func test_WhenDeleteTaskCalled_ThenPresentTaskDeletionCalledWithCorrectArguments() {
    // given
    let index = 0
    let request: TaskList.DeleteTask.Request = .init(index: index)
    
    let expectedTaskCount = 2
    let stubbedTasks = MockTask.makeTasks(count: expectedTaskCount)
    var expectedTasks = stubbedTasks
    expectedTasks.remove(at: index)
    
    // when
    mockDataStore.tasks = stubbedTasks
    mockPersistenceLayer.currentTasks = stubbedTasks
    sut.deleteTask(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentTaskDeletionCallCount, 1, "presentTaskDeletion(_:) is not called 1 time")
    XCTAssertEqual(mockPresenter.presentTaskDeletionReceivedResponse?.tasks as? [MockTask], expectedTasks, "presentTaskDeletion(_:) is not called with correct arguments")
  }
}

// MARK: Add Task Handler Tests

extension TaskListInteractorTests {
  func test_WhenAddTaskHandlerCalledWithNilString_ThenPresentTasksIsNotCalled() {
    // given
    
    verifyAddTaskHandler(for: nil, shouldProceed: false)
  }
  
  func test_WhenAddTaskHandlerCalledWithEmptyString_ThenPresentTasksIsNotCalled() {
    // given

    verifyAddTaskHandler(for: "", shouldProceed: false)
  }
  
  func test_WhenAddTaskHandlerCalledWithValidString_ThenPresentTasksCalledWithCorrectArguments() {
    // given
    
    verifyAddTaskHandler(for: "Valid task description", shouldProceed: true)
  }
  
  private func verifyAddTaskHandler(for string: String?, shouldProceed: Bool, file: StaticString = #file, line: UInt = #line) {
    // when
    let expectedCount = shouldProceed ? 1 : 0
    let expectedTasks: [MockTask]? = shouldProceed ? [MockTask(taskDescription: string!, recordDate: Date())] : nil
    sut.addTaskHandler(with: string)
    
    // then
    XCTAssertEqual(mockPresenter.presentTasksCallCount,
                   expectedCount,
                   "presentTasks(_:) is not called \(expectedCount) time",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockPresenter.presentTasksReceivedResponse?.tasks as? [MockTask],
                   expectedTasks,
                   "presentTasks(_:) is not called with correct arguments",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockPersistenceLayer.saveCallCount,
                   expectedCount,
                   "saveCallCount is not equal to \(expectedCount)",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockDataStore.tasks.count,
                   expectedCount,
                   "task count is not equal to \(expectedCount)",
                   file: file,
                   line: line)
  }
}

// MARK: Edit Task Handler Tests

extension TaskListInteractorTests {
  func test_WhenEditTaskHandlerCalledWithNilString_ThenPresentTasksIsNotCalled() {
    // given
    
    verifyEditTaskHandler(for: nil, shouldProceed: false)
  }
  
  func test_WhenEditTaskHandlerCalledWithEmptyString_ThenPresentTasksIsNotCalled() {
    // given
    
    verifyEditTaskHandler(for: "", shouldProceed: false)
  }
  
  func test_WhenEditTaskHandlerCalledWithValidString_ThenPresentTasksCalledWithCorrectArguments() {
    // given
    
    verifyEditTaskHandler(for: "Valid task description", shouldProceed: true)
  }
  
  private func verifyEditTaskHandler(for string: String?, shouldProceed: Bool, file: StaticString = #file, line: UInt = #line) {
    // when
    let expectedCount = shouldProceed ? 1 : 0
    let stubbedTasks = MockTask.makeTasks(count: 2)
    
    mockDataStore.tasks = stubbedTasks
    mockDataStore.editingTask = stubbedTasks.last
    mockPersistenceLayer.currentTasks = stubbedTasks
    
    var expectedTasks: [MockTask]?
    if shouldProceed {
      expectedTasks = stubbedTasks.dropLast()
      expectedTasks?.append(MockTask(taskDescription: string!, recordDate: Date()))
    }
      
    sut.editTaskHandler(with: string)
    
    // then
    XCTAssertEqual(mockPresenter.presentTasksCallCount,
                   expectedCount,
                   "presentTasks(_:) is not called \(expectedCount) time",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockPresenter.presentTasksReceivedResponse?.tasks as? [MockTask],
                   expectedTasks,
                   "presentTasks(_:) is not called with correct arguments",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockPersistenceLayer.updateCallCount,
                   expectedCount,
                   "updateCallCount is not equal to \(expectedCount)",
                   file: file,
                   line: line)
    
    XCTAssertEqual(mockDataStore.editingTask as? MockTask,
                   shouldProceed ? nil : stubbedTasks.last,
                   "editingTask is not as expected",
                   file: file,
                   line: line)
  }
}
