//
//  TaskEditorModels.swift
//  ToDo
//
//  Created by Okhan Okbay on 8.11.2020.
//

import Foundation

enum TaskEditor {
  
  // MARK: Use cases
  
  enum SetupInitials {
    struct Request {}
    
    struct Response {
      let initialText: String?
    }
    
    struct ViewModel {
      let initialText: String?
    }
  }
  
  enum CompleteEntry {
    struct Request {
      let text: String
    }
    
    struct Response {}
    
    struct ViewModel {}
  }
}
