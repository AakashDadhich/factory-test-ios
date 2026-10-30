enum Greeting {
    static let maxLength = 40

    static func message(for name: String) -> String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, trimmed.count <= maxLength, trimmed.allSatisfy(\.isLetter) else {
            return "Hello!"
        }
        return "Hello, \(trimmed)!"
    }
}
