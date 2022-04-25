//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // ベースとなるCoordinator
    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

