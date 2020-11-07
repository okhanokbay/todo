//
//  TaskListPresenter.swift
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

protocol TaskListPresentationLogic: AnyObject {
  func presentTasks(response: TaskList.FetchTasks.Response)
  func presentNewTaskAddition(response: TaskList.AddNewTask.Response)
  func presentTaskEditing(response: TaskList.EditTask.Response)
}

final class TaskListPresenter {
  private weak var displayer: TaskListDisplayLogic?
  
  init(displayer: TaskListDisplayLogic) {
    self.displayer = displayer
  }
}

extension TaskListPresenter: TaskListPresentationLogic {
  func presentTasks(response: TaskList.FetchTasks.Response) {
    let cellViewModels = response.tasks.map(TaskList.TaskCellViewModel.init)
    let viewModel = TaskList.FetchTasks.ViewModel(cellViewModels: cellViewModels)
    displayer?.displayTasks(viewModel: viewModel)
  }
  
  func presentNewTaskAddition(response: TaskList.AddNewTask.Response) {
    let viewModel = TaskList.AddNewTask.ViewModel(response: response)
    displayer?.displayNewTaskAddition(viewModel: viewModel)
  }
  
  func presentTaskEditing(response: TaskList.EditTask.Response) {
    let viewModel = TaskList.EditTask.ViewModel(response: response)
    displayer?.displayTaskEditing(viewModel: viewModel)
  }
}
