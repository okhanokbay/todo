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
  func displayTasks(viewModel: TaskList.FetchTasks.ViewModel)
  func displayNewTaskAddition(viewModel: TaskList.AddNewTask.ViewModel)
  func displayTaskEditing(viewModel: TaskList.EditTask.ViewModel)
  func displayTaskDeletion(viewModel: TaskList.DeleteTask.ViewModel)
}

final class TaskListViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  
  private var interactor: TaskListBusinessLogic!
  private var router: TaskListRoutingLogic!
  
  private var tableViewDataSource: TaskListTableViewDataSource!
  private var tableViewDelegate: TaskListTableViewDelegate!
  
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
    let presenter = TaskListPresenter(displayer: self)
    let interactor = TaskListInteractor(dataStore: dataStore, presenter: presenter)
    let router = TaskListRouter(viewController: self)
    
    self.interactor = interactor
    self.router = router
    
    tableViewDataSource = TaskListTableViewDataSource(cellDeletionHandler: deleteCell)
    tableViewDelegate = TaskListTableViewDelegate(cellSelectionHandler: selectedCell)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureNavigationItem()
    configureTableView()
    fetchTasks()
  }
}

// MARK: TaskListViewController Scoped Methods

extension TaskListViewController {
  func configureNavigationItem() {
    navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
  }
  
  func configureTableView() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: TaskListTableViewDataSource.cellIdentifier)
    tableView.dataSource = tableViewDataSource
    tableView.delegate = tableViewDelegate
  }
  
  func fetchTasks() {
    let request = TaskList.FetchTasks.Request()
    interactor.fetchTasks(request: request)
  }
  
  @objc func didTapAddButton() {
    let request = TaskList.AddNewTask.Request()
    interactor.addNewTask(request: request)
  }
  
  func selectedCell(at indexPath: IndexPath) {
    let request = TaskList.EditTask.Request(index: indexPath.row)
    interactor.editTask(request: request)
  }
  
  func deleteCell(at indexPath: IndexPath) {
    let request = TaskList.DeleteTask.Request(index: indexPath.row)
    interactor.deleteTask(request: request)
  }
}

// MARK: Display Logic

extension TaskListViewController: TaskListDisplayLogic {
  func displayTasks(viewModel: TaskList.FetchTasks.ViewModel) {
    tableViewDataSource.cellViewModels = viewModel.cellViewModels
    tableView.reloadData()
  }
  
  func displayNewTaskAddition(viewModel: TaskList.AddNewTask.ViewModel) {
    router.routeToTaskEditor(viewModel: viewModel)
  }
  
  func displayTaskEditing(viewModel: TaskList.EditTask.ViewModel) {
    router.routeToTaskEditorForEditing(viewModel: viewModel)
  }
  
  func displayTaskDeletion(viewModel: TaskList.DeleteTask.ViewModel) {
    tableViewDataSource.cellViewModels = viewModel.cellViewModels
    tableView.reloadData()
  }
}
