//
//  UIView+Extensions.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import UIKit

extension UIView {
  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: Self.self))
  }
}
