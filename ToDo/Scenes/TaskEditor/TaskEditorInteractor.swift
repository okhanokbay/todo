//
//  TaskEditorInteractor.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import Foundation

protocol TaskEditorBusinessLogic: AnyObject {
  func setupInitials(request: TaskEditor.SetupInitials.Request)
  func completeEntry(request: TaskEditor.CompleteEntry.Request)
}

final class TaskEditorInteractor {
  private let dataStore: TaskEditorDataStoreProtocol
  private let presenter: TaskEditorPresentationLogic
  
  init(dataStore: TaskEditorDataStoreProtocol,
       presenter: TaskEditorPresentationLogic) {
    
    self.dataStore = dataStore
    self.presenter = presenter
  }
}

extension TaskEditorInteractor: TaskEditorBusinessLogic {
  func setupInitials(request: TaskEditor.SetupInitials.Request) {
    let response = TaskEditor.SetupInitials.Response(initialText: dataStore.initialText)
    presenter.presentInitials(response: response)
  }
  
  func completeEntry(request: TaskEditor.CompleteEntry.Request) {
    dataStore.taskEditorOperationEnded(request.text)
    
    let response = TaskEditor.CompleteEntry.Response()
    presenter.presentEntryCompletion(response: response)
  }
}
