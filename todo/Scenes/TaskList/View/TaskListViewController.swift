//
//  TaskListViewController.swift
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

protocol TaskListDisplayLogic: AnyObject {
  
}

final class TaskListViewController: UIViewController {
  
  private var interactor: TaskListBusinessLogic!
  var router: (TaskListRoutingLogic & TaskListDataPassing)!
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let dataStore = TaskListDataStore()
    let worker = TaskListWorker()
    let presenter = TaskListPresenter(displayer: self)
    let interactor = TaskListInteractor(dataStore: dataStore, worker: worker, presenter: presenter)
    let router = TaskListRouter(dataStore: dataStore, viewController: self)
    
    self.interactor = interactor
    self.router = router
  }
}

extension TaskListViewController: TaskListDisplayLogic {
  
}
