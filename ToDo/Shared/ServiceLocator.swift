//
//  ServiceLocator.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

enum ServiceLocator {
  static func makeTaskListViewController() -> TaskListViewController {
    let taskList = TaskListViewController.loadFromNib()
    
    let dataStore = TaskListDataStore()
    let presenter = TaskListPresenter(displayer: taskList)
    let interactor = TaskListInteractor(persistenceLayer: CoreDataStack.shared, dataStore: dataStore, presenter: presenter)
    let router = TaskListRouter(dataStore: dataStore, viewController: taskList)
    
    taskList.interactor = interactor
    taskList.router = router
    
    return taskList
  }
  
  static func makeTaskEditorViewController(taskEditorOperationDidEnd: TextHandler?,
                                           initialText: String?) -> TaskEditorViewController {
    
    let taskEditor = TaskEditorViewController.loadFromNib()
    
    let dataStore = TaskEditorDataStore()
    dataStore.taskEditorOperationDidEnd = taskEditorOperationDidEnd
    dataStore.initialText = initialText
    
    let presenter = TaskEditorPresenter(displayer: taskEditor)
    let interactor = TaskEditorInteractor(dataStore: dataStore, presenter: presenter)
    let router = TaskEditorRouter(dataStore: dataStore, viewController: taskEditor)
    
    taskEditor.interactor = interactor
    taskEditor.router = router
    
    return taskEditor
  }
}
