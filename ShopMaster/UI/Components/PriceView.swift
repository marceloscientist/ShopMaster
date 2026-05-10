import SwiftUI

struct PriceView: View {

    let price: Double

    var body: some View {
        Text(price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

#Preview {
    PriceView(price: 2499.00)
}
