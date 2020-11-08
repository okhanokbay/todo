//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
  @IBOutlet private weak var itemLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  
    itemLabel.numberOfLines = 0
    accessoryType = .disclosureIndicator
  }
  
  func configureCell(with viewModel: ItemCellViewModelable) {
    itemLabel.text = viewModel.labelText
  }
}
