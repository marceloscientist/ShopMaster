import Foundation

struct ProductsService {

    static func fetchProducts() -> [Product] {
        return [
            Product(id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
                    name: "AirPods Pro",
                    price: 2499),

            Product(id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
                    name: "iPhone 15",
                    price: 7999),

            Product(id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!,
                    name: "MacBook Pro",
                    price: 18999)
        ]
    }
}
