import SwiftUI

struct HomeView: View {

    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject private var viewModel = HomeViewModel()

    @Binding var selectedTab: Tab

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {

                    // MARK: - Monthly Summary
                    VStack(spacing: 8) {
                        Text("You spent this month")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(
                            viewModel.monthlyTotal,
                            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .font(.largeTitle)
                        .bold()
                    }

                    // MARK: - Incentive
                    VStack(spacing: 8) {
                        Text("Free shipping inside country")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)

                    // MARK: - Last Purchase (NOVA VERSÃO CORRETA)
                    if !viewModel.lastPurchaseProduct.isEmpty {
                        VStack(spacing: 12) {
                            Text("Last purchase")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Text(viewModel.lastPurchaseProduct)
                                .font(.title3)
                                .bold()
                        }
                    }

                    // MARK: - Quick Actions
                    VStack(spacing: 12) {

                        Text("Quick Actions")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Button {
                            selectedTab = .products
                        } label: {
                            Text("View Products")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .font(.headline)
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)

                        Button {
                            selectedTab = .cart
                        } label: {
                            Text("View Cart")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .font(.headline)
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }

        // ✅ ✅ ATUALIZAÇÃO DA HOME (ESSENCIAL)


        .onAppear {
                   viewModel.update(cartItems: cartViewModel.items)
               }

               // ✅ DISPARA APÓS COMPRA
               .onChange(of: cartViewModel.lastCheckoutDate) {
                   viewModel.update(cartItems: cartViewModel.items)
               }

    }
}

#Preview {
    HomeView(selectedTab: .constant(.home))
        .environmentObject(CartViewModel())
}

