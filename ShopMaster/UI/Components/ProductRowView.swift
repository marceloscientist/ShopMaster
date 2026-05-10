import SwiftUI

struct ProductRowView: View {

    let product: Product

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)

                PriceView(price: product.price)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ProductRowView(
        product: Product(id: UUID(), name: "Sample Product", price: 99.90)
    )
}
