//
//  TaskEditorInteractor.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol TaskEditorBusinessLogic: AnyObject {
  
}

final class TaskEditorInteractor {
  private let dataStore: TaskEditorDataStoreProtocol
  private let worker: TaskEditorWorkerProtocol
  private let presenter: TaskEditorPresentationLogic
  
  init(dataStore: TaskEditorDataStoreProtocol,
       worker: TaskEditorWorkerProtocol,
       presenter: TaskEditorPresentationLogic) {
    
    self.dataStore = dataStore
    self.worker = worker
    self.presenter = presenter
  }
}

extension TaskEditorInteractor: TaskEditorBusinessLogic {
  
}
