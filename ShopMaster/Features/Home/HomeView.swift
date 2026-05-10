//
//  ContentView.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 09/05/26.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    HomeView()
        .environmentObject(CartViewModel())
}
