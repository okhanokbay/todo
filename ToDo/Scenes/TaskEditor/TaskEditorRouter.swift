//
//  TaskEditorRouter.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

protocol TaskEditorRoutingLogic: AnyObject {
  func routeToBack()
}

protocol TaskEditorDataPassing: AnyObject {
  var dataStore: TaskEditorDataStoreProtocol { get }
}

final class TaskEditorRouter: TaskEditorDataPassing {
  var dataStore: TaskEditorDataStoreProtocol
  private weak var viewController: TaskEditorViewController?
  
  init(dataStore: TaskEditorDataStoreProtocol,
       viewController: TaskEditorViewController) {
    
    self.dataStore = dataStore
    self.viewController = viewController
  }
}

extension TaskEditorRouter: TaskEditorRoutingLogic {
  func routeToBack() {
    viewController?.navigationController?.popViewController(animated: true)
  }
}

