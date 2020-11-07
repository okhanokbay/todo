//
//  TaskListTableViewDelegate.swift
//  todo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

final class TaskListTableViewDelegate: NSObject, UITableViewDelegate {
  private var cellSelectionHandler: (IndexPath) -> Void
  
  init(cellSelectionHandler: @escaping (IndexPath) -> Void) {
    self.cellSelectionHandler = cellSelectionHandler
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    cellSelectionHandler(indexPath)
  }
}
