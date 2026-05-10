import SwiftUI

struct CartView: View {

    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if cartViewModel.items.isEmpty {
                    VStack(spacing: 20) {
                        Text("Your Cart is")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)

                        Text("EMPTY")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(
                        "Nenhum produto foi adicionado ao carrinho ainda"
                    )

                } else {
                    List {
                        ForEach(cartViewModel.items) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(item.quantity) × \(item.product.name)")
                                        .font(.body)
                                        .accessibilityLabel(
                                            "\(item.quantity) items of \(item.product.name)"
                                        )
                                }

                                Spacer()

                                PriceView(
                                    price: item.product.price * Double(item.quantity)
                                )
                                .font(.title3)
                                .bold()
                            }
                            .accessibilityElement(children: .combine)
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let product = cartViewModel.items[index].product
                                cartViewModel.remove(product: product)
                            }
                        }
                    }

                    Divider()

                    VStack(spacing: 4) {
                        Text("Total")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(
                            cartViewModel.totalPrice,
                            format: .currency(
                                code: Locale.current.currency?.identifier ?? "USD"
                            )
                        )
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                    }
                    .padding()
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(
                        "Total amount \(cartViewModel.totalPrice) currency"
                    )

                    PrimaryButton(title: "Clear Cart", isCompact: false) {
                        cartViewModel.clear()
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
