import Foundation
import Combine

final class CartViewModel: ObservableObject {

    @Published private(set) var items: [CartItem] = []

    var totalPrice: Double {
        items.reduce(0) { partialResult, item in
            partialResult + (item.product.price * Double(item.quantity))
        }
    }

    func add(product: Product) {
        guard product.price > 0 else { return }
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            let item = CartItem(product: product, quantity: 1)
            items.append(item)
        }
    }

    func remove(product: Product) {
        guard items.contains(where: { $0.product.id == product.id}) else { return }
        items.removeAll { $0.product.id == product.id }
    }

    func clear() {
        items.removeAll()
    }
}
