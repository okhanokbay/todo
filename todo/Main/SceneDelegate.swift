//
//  SceneDelegate.swift
//  todo
//
//  Created by Okhan Okbay on 7.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      
      window = UIWindow(windowScene: windowScene)
      
      let loginViewController = TaskListViewController.loadFromNib()
      let navigationController = UINavigationController(rootViewController: loginViewController)

      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
    }

  func sceneDidEnterBackground(_ scene: UIScene) {

    // Save changes in the application's managed object context when the application transitions to the background.
    CoreDataStack.shared.saveContext()
  }
}

