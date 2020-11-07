//
//  TaskListTableViewDataSource.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import UIKit

final class TaskListTableViewDataSource: NSObject, UITableViewDataSource {
  var cellIdentifier = "TaskCell"
  var cellViewModels: [TaskList.TaskCellViewModel] = []
  
  private var cellDeletionHandler: (IndexPath) -> Void
  
  init(cellDeletionHandler: @escaping (IndexPath) -> Void) {
    self.cellDeletionHandler = cellDeletionHandler
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    cell.textLabel?.text = cellViewModels[indexPath.row].description
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      cellDeletionHandler(indexPath)
      tableView.performBatchUpdates {
      tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
  }
}
