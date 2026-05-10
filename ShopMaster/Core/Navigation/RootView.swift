import SwiftUI

struct RootView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Products")
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }

            Text("Cart")
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
    }
}

#Preview {
    RootView()
}
