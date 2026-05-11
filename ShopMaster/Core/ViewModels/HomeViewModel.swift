import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var monthlyTotal: Double = 0
    @Published var lastPurchaseProduct: String = ""
    
    private let historyKey = "purchaseHistory"

    func update(cartItems: [CartItem]) {
        
        let history = loadHistory()

        let total = history.reduce(0) { result, purchase in
            result + purchase.total
        }

        monthlyTotal = total
        
        if let last = history.last {
            lastPurchaseProduct = "R$ \(last.total)"
        }

    }

    private func loadHistory() -> [Purchase] {
        if let data = UserDefaults.standard.data(forKey: historyKey),
           let decoded = try? JSONDecoder().decode([Purchase].self, from: data) {
            return decoded
        }
        return []
    }

    private func lastProductName(from purchase: Purchase) -> String {
        return "Recent purchase"
    }
}
