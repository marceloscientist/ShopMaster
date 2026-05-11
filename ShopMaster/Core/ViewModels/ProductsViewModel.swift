import Foundation
import Combine

final class ProductsViewModel: ObservableObject {

    @Published private(set) var products: [Product] = []

    func loadProducts() {
        products = ProductsService.fetchProducts()
    }
    
}
