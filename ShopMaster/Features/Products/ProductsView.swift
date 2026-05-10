import SwiftUI

struct ProductsView: View {

    @StateObject private var viewModel = ProductsViewModel()

    var body: some View {
        NavigationStack {
            Text("Products count: \(viewModel.products.count)")
            List(viewModel.products) { product in
                    ProductRowView(product: product)
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
}

