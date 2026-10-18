import Foundation

enum Strings {
    static let errorNotFoundTitle = LocalizedStringResource(
        "error.not_found.title",
        defaultValue: "Not found",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorNotFoundSubtitle = LocalizedStringResource(
        "error.not_found.subtitle",
        defaultValue: "This anime list is no longer available",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorAccessDeniedTitle = LocalizedStringResource(
        "error.access_denied.title",
        defaultValue: "Access denied",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorAccessDeniedSubtitle = LocalizedStringResource(
        "error.access_denied.subtitle",
        defaultValue: "You don't have permission to view this content",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorRateLimitedTitle = LocalizedStringResource(
        "error.rate_limited.title",
        defaultValue: "Too many requests",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorRateLimitedSubtitle = LocalizedStringResource(
        "error.rate_limited.subtitle",
        defaultValue: "Please wait a moment and try again",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorUnavailableTitle = LocalizedStringResource(
        "error.unavailable.title",
        defaultValue: "No connection",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorUnavailableSubtitle = LocalizedStringResource(
        "error.unavailable.subtitle",
        defaultValue: "Check your internet connection and try again",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorInvalidDataTitle = LocalizedStringResource(
        "error.invalid_data.title",
        defaultValue: "Something went wrong",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorInvalidDataSubtitle = LocalizedStringResource(
        "error.invalid_data.subtitle",
        defaultValue: "We received unexpected data from the server",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorUnknownTitle = LocalizedStringResource(
        "error.unknown.title",
        defaultValue: "Unknown error",
        bundle: .atURL(Bundle.module.bundleURL),
    )
    static let errorUnknownSubtitle = LocalizedStringResource(
        "error.unknown.subtitle",
        defaultValue: "Please try again later",
        bundle: .atURL(Bundle.module.bundleURL),
    )
}
