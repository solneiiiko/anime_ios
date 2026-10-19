import Foundation
import CoreDomain
import DesignSystem

public extension RepositoryError {

    var asUiError: UiError {
        switch self {
        case .notFound:
            UiError(
                title: Strings.errorNotFoundTitle,
                subtitle: Strings.errorNotFoundSubtitle
            )
        case .accessDenied:
            UiError(
                title: Strings.errorAccessDeniedTitle,
                subtitle: Strings.errorAccessDeniedSubtitle
            )
        case .rateLimited:
            UiError(
                title: Strings.errorRateLimitedTitle,
                subtitle: Strings.errorRateLimitedSubtitle
            )
        case .unavailable:
            UiError(
                title: Strings.errorUnavailableTitle,
                subtitle: Strings.errorUnavailableSubtitle
            )
        case .invalidData:
            UiError(
                title: Strings.errorInvalidDataTitle,
                subtitle: Strings.errorInvalidDataSubtitle
            )
        case .unknown:
            UiError(
                title: Strings.errorUnknownTitle,
                subtitle: Strings.errorUnknownSubtitle
            )
        }
    }
}
