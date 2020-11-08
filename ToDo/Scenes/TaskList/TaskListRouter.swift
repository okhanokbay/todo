//
//  TaskListRouter.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TaskListRoutingLogic: AnyObject {
  func routeToTaskEditor(viewModel: TaskList.AddNewTask.ViewModel)
  func routeToTaskEditorForEditing(viewModel: TaskList.EditTask.ViewModel)
}

protocol TaskListDataPassing: AnyObject {
  var dataStore: TaskListDataStoreProtocol { get }
}

final class TaskListRouter {
  var dataStore: TaskListDataStoreProtocol
  private weak var viewController: TaskListViewController?
  
  init(dataStore: TaskListDataStoreProtocol,
       viewController: TaskListViewController) {
    
    self.dataStore = dataStore
    self.viewController = viewController
  }
}

extension TaskListRouter: TaskListRoutingLogic {
  func routeToTaskEditor(viewModel: TaskList.AddNewTask.ViewModel) {
    routeToTaskEditor(handler: viewModel.handler)
  }
  
  func routeToTaskEditorForEditing(viewModel: TaskList.EditTask.ViewModel) {
    routeToTaskEditor(handler: viewModel.handler, initialText: viewModel.initialText)
  }
  
  private func routeToTaskEditor(handler: @escaping (String?) -> Void, initialText: String? = nil) {
    let taskEditor: TaskEditorViewController = ServiceLocator.makeTaskEditorViewController(taskEditorOperationDidEnd: handler,
                                                                                           initialText: initialText)
    
    viewController?.navigationController?.pushViewController(taskEditor, animated: true)
  }
}
