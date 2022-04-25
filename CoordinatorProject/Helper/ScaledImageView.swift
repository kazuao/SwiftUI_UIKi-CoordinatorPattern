//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import SwiftUI

struct ScaledImageView: View {
    
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
