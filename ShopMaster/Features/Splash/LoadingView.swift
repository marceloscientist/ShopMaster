//
//  LoadingView.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 11/05/26.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image("splashLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)

                ProgressView()
            }
        }
    }
}
