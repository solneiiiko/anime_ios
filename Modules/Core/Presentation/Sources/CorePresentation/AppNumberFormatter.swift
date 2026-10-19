import Foundation

public struct AppNumberFormatter {

    private static let locale = Locale(identifier: "en_US")

    public init() {}

    public func formatScore(_ score: Double) -> String {
        score.formatted(
            .number
                .precision(.fractionLength(2))
                .locale(Self.locale)
        )
    }

    public func formatCommon(_ value: Int) -> String {
        let magnitude = value.magnitude

        if magnitude >= 1_000_000 {
            return formatCompact(
                Double(value) / 1_000_000,
                suffix: "M"
            )
        }

        if magnitude >= 10_000 {
            return formatCompact(
                Double(value) / 1_000,
                suffix: "K"
            )
        }

        return value.formatted(
            .number
                .grouping(.automatic)
                .locale(Self.locale)
        )
    }

    private func formatCompact(
        _ value: Double,
        suffix: String
    ) -> String {
        value.formatted(
            .number
                .precision(.fractionLength(1))
                .locale(Self.locale)
        ) + suffix
    }
}
