import Foundation
import Combine

final class CartViewModel: ObservableObject {
   
    @Published var items: [CartItem] = []
    @Published var lastCheckoutDate: Date = Date()
    
    private let cartKey = "cartItems"
    
    init() {
        load()
    }
 
    var totalPrice: Double {
        items.reduce(0) { total, item in
            total + (item.product.price * Double(item.quantity))
        }
    }
 
    func quantity(for product: Product) -> Int {
        items.first(where: { $0.product.id == product.id })?.quantity ?? 0
    }
 
    func add(product: Product) {
        guard product.price > 0 else { return }

        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            let newItem = CartItem(product: product, quantity: 1)
            items.append(newItem)
        }

        save()
    }

    func remove(product: Product) {

        guard let index = items.firstIndex(where: { $0.product.id == product.id }) else {
            return
        }

        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }

        save()
    }
 
    func clear() {
        items.removeAll()
        save()
    }

    func checkout() {

        let purchase = Purchase(total: totalPrice)

        var history = loadHistory()
        history.append(purchase)

        saveHistory(history)

        items.removeAll()
        save()
 
        lastCheckoutDate = Date()
    }


    private let historyKey = "purchaseHistory"

    private func saveHistory(_ history: [Purchase]) {
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: historyKey)
        }
    }

    func loadHistory() -> [Purchase] {
        if let data = UserDefaults.standard.data(forKey: historyKey),
           let decoded = try? JSONDecoder().decode([Purchase].self, from: data) {
            return decoded
        }
        return []
    }
    // MARK: - Persistence

    private func save() {
        do {
            let encoded = try JSONEncoder().encode(items)
            UserDefaults.standard.set(encoded, forKey: cartKey)
        } catch {
            print("Error saving cart:", error)
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: cartKey) else { return }

        do {
            let decoded = try JSONDecoder().decode([CartItem].self, from: data)
            items = decoded
        } catch {
            print("Error loading cart:", error)
        }
    }
}
