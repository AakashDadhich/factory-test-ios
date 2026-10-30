import Logging
import SwiftUI

struct ContentView: View {
    private static let logger = Logger(label: "dev.aakashdadhich.factory.FactoryTestIOS")

    @State private var name = ""
    @State private var lastName = KeychainStore.load(account: "last-name") ?? ""

    var body: some View {
        VStack(spacing: 12) {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text(Greeting.message(for: name))
                .font(.title2)
            if !lastName.isEmpty {
                Text("Last greeted: \(lastName)")
                    .font(.footnote)
            }
        }
        .padding(24)
        .onChange(of: name) { _, newValue in
            Self.logger.debug("name changed")
            if KeychainStore.save(newValue, account: "last-name") {
                lastName = newValue
            }
        }
    }
}
