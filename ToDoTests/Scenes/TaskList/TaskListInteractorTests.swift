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
  private var mockPersistenceLayer: PersistenceLayer!
  private var mockDataStore: TaskListDataStoreProtocol!
  private var mockPresenter: TaskListPresentationLogic!
  
  override func setUpWithError() throws {
    mockPersistenceLayer = MockPersistenceLayer()
    mockDataStore = MockTaskListDataStore()
    mockPresenter = MockTaskListPresenter()
    
    sut = TaskListInteractor(persistenceLayer: mockPersistenceLayer,
                             dataStore: mockDataStore,
                             presenter: mockPresenter)
  }
}

extension TaskListInteractorTests {
  func test_WhenFetchTasksCalled_ThenPresenterCalledWithCorrectArguments() {
    // given
    let 
    
    // when
    
    // then
  }
}
