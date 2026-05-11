import SwiftUI

struct ProductRowView: View {

    let product: Product
    let quantity: Int
    let onAdd: () -> Void
    let onRemove: () -> Void


    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)

                PriceView(price: product.price)
            }

            Spacer()

            if quantity == 0 {
                PrimaryButton(title: "Add to cart", isCompact: true) {
                    onAdd()
                }
                .accessibilityLabel("Add \(product.name) to cart")
            } else {
                HStack(spacing: 12) {
                    Button {
                        onRemove()
                    } label: {
                        Image(systemName: "minus")
                            .font(.title2)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.bordered)
                    .accessibilityLabel("Remove one \(product.name)")

                    Text("\(quantity)")
                        .font(.headline)
                        .frame(minWidth: 24)
                        .accessibilityLabel("\(quantity) items selected")

                    Button {
                        onAdd()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.bordered)
                    .accessibilityLabel("Add one \(product.name)")
                }
            }
        }
        .padding(.vertical, 6)
    }
}
 
#Preview {
    ProductRowView(
        product: Product(id: UUID(), name: "Sample Product", price: 99.90),
        quantity: 2,
        onAdd: {},
        onRemove: {}
    )
}
