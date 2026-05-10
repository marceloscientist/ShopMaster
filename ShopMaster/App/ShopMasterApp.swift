//
//  ShopMasterApp.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 09/05/26.
//

import SwiftUI

@main
struct ShopMasterApp: App {
    
    @StateObject private var cartViewModel = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(cartViewModel)

        }
    }
}
