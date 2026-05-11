import SwiftUI

struct ProductsView: View {

    @StateObject private var viewModel = ProductsViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in

                let quantity = cartViewModel.quantity(for: product)

                ProductRowView(
                    product: product,
                    quantity: quantity,
                    onAdd: {
                        cartViewModel.add(product: product)
                        
                        // ✅ salva último produto visto
                        UserDefaults.standard.set(product.name, forKey: "lastViewedProduct")
                    },
                    onRemove: {
                        cartViewModel.remove(product: product)
                    }
                )
            }
            .navigationTitle("Products")
        }
        .task {
            viewModel.loadProducts()
        }
    }
}

#Preview {
    ProductsView()
        .environmentObject(CartViewModel())
}
