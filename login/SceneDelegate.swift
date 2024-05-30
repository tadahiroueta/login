//
//  SceneDelegate.swift
//  login
//
//  Created by Ueta, Lucas T on 1/24/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window = UIWindow(windowScene: scene as! UIWindowScene)
        let controller = UINavigationController(rootViewController: LoginPage())
        controller.navigationBar.prefersLargeTitles = true
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
    }
}
