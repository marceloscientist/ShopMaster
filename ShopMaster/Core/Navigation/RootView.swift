import SwiftUI

enum Tab {
    case home
    case products
    case cart
}

struct RootView: View {

    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }
                .tag(Tab.products)

            CartView(selectedTab: $selectedTab)                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .tag(Tab.cart)
        }
    }
}
