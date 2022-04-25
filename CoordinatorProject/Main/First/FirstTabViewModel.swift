//
//  FirstTabViewModel.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import Foundation

class FirstTabViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""
}
