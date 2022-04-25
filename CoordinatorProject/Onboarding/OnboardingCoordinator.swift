//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {

    var rootViewController = UIViewController()

    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>

    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }

    func start() {
        let view = OnboardingView { [ weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)

    }
}
