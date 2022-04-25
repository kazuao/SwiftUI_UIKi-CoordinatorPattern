//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import SwiftUI
import UIKit
import Combine

class ApplicationCoordinator: Coordinator {

    let window: UIWindow

    var childCoordinators = [Coordinator]()

    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        // SwiftUI Viewをrootに設定する場合は、UIHostingControllerを使う
//        window.rootViewController = UIHostingController(rootView: ContentView())

        setupOnboardingValue()

        hasSeenOnboarding
            .removeDuplicates() // 重複を防げる
            .sink { [weak self] hasSeen in

            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController

            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {

                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }
        .store(in: &subscriptions)
    }

    func setupOnboardingValue() {
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)

        hasSeenOnboarding
            .filter { $0 }
            .sink { value in
                UserDefaults.standard.set(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
