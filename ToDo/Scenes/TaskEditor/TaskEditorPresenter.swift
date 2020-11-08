//
//  TaskEditorPresenter.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

protocol TaskEditorPresentationLogic: AnyObject {
  func presentInitials(response: TaskEditor.SetupInitials.Response)
  func presentEntryCompletion(response: TaskEditor.CompleteEntry.Response)
}

final class TaskEditorPresenter {
  private weak var displayer: TaskEditorDisplayLogic?
  
  init(displayer: TaskEditorDisplayLogic) {
    self.displayer = displayer
  }
}

extension TaskEditorPresenter: TaskEditorPresentationLogic {
  func presentInitials(response: TaskEditor.SetupInitials.Response) {
    let viewModel = TaskEditor.SetupInitials.ViewModel(initialText: response.initialText)
    displayer?.displayInitials(viewModel: viewModel)
  }
  
  func presentEntryCompletion(response: TaskEditor.CompleteEntry.Response) {
    let viewModel = TaskEditor.CompleteEntry.ViewModel()
    displayer?.displayEntryCompletion(viewModel: viewModel)
  }
}

