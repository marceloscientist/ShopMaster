import SwiftUI

struct ProductsView: View {

    @StateObject private var viewModel = ProductsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name)
                        .font(.headline)

                    Text("R$ \(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Products")
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}

#Preview {
    ProductsView()
}

