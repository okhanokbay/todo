//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var itemLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    accessoryType = .disclosureIndicator
  }
  
  func configureCell(with viewModel: ItemCellViewModelable) {
    itemLabel.text = viewModel.labelText
  }
}
