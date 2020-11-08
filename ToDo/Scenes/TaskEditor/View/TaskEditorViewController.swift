//
//  TaskEditorViewController.swift
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

protocol TaskEditorDisplayLogic: AnyObject {
  func displayInitials(viewModel: TaskEditor.SetupInitials.ViewModel)
  func displayEntryCompletion(viewModel: TaskEditor.CompleteEntry.ViewModel)
}

final class TaskEditorViewController: UIViewController {
  @IBOutlet private weak var textView: UITextView!
  
  private var interactor: TaskEditorBusinessLogic!
  var router: (TaskEditorRoutingLogic & TaskEditorDataPassing)!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureNavigationItem()
    configureTextView()
    setupInitials()
  }
  
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
    let dataStore = TaskEditorDataStore()
    let presenter = TaskEditorPresenter(displayer: self)
    let interactor = TaskEditorInteractor(dataStore: dataStore, presenter: presenter)
    let router = TaskEditorRouter(dataStore: dataStore, viewController: self)
    
    self.interactor = interactor
    self.router = router
  }
}

// MARK: TaskEditorViewController Scoped Methods

extension TaskEditorViewController {
  func configureNavigationItem() {
    navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
  }
  
  func configureTextView() {
    textView.becomeFirstResponder()
  }
  
  func setupInitials() {
    let request = TaskEditor.SetupInitials.Request()
    interactor.setupInitials(request: request)
  }
  
  @objc func didTapDoneButton() {
    let request = TaskEditor.CompleteEntry.Request(text: textView.text)
    interactor.completeEntry(request: request)
  }
}

extension TaskEditorViewController: TaskEditorDisplayLogic {
  func displayInitials(viewModel: TaskEditor.SetupInitials.ViewModel) {
    textView.text = viewModel.initialText
  }
  
  func displayEntryCompletion(viewModel: TaskEditor.CompleteEntry.ViewModel) {
    router.routeToBack()
  }
}
