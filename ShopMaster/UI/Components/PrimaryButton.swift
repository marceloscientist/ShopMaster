import SwiftUI

struct PrimaryButton: View {

    let title: String
    let isCompact: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: isCompact ? nil : .infinity)
                .padding()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(isCompact ? .small : .large)
    }
}
