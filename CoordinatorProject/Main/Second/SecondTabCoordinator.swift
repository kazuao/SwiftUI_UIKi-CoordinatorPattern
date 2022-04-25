//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import Foundation
import UIKit

class SecondTabCoordinator: Coordinator {

    var rootViewController = UINavigationController()

    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
