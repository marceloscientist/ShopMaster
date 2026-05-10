import Foundation

struct ProductsService {

    static func fetchProducts() -> [Product] {
        return [
            Product(
                id: UUID(),
                name: "iPhone 15",
                price: 7999.00
            ),
            Product(
                id: UUID(),
                name: "MacBook Pro",
                price: 18999.00
            ),
            Product(
                id: UUID(),
                name: "AirPods Pro",
                price: 2499.00
            )
        ]
    }
}
