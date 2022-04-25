//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import SwiftUI

struct FirstDetailView: View {

    @ObservedObject var viewModel: FirstTabViewModel

    var body: some View {
        VStack {
            Text("First Detail")

            TextField("name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

        }

    }
}
