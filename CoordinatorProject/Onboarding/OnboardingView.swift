//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import SwiftUI

struct OnboardingView: View {

    var doneRequested: () -> Void

    var body: some View {
        TabView {
            ScaledImageView(name: "cat")
                .tag(0)
            ScaledImageView(name: "lama")
                .tag(1)
            ScaledImageView(name: "rose")
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black
                        .ignoresSafeArea(.all))

        Button("Done") {
            doneRequested()
        }
    }
}
