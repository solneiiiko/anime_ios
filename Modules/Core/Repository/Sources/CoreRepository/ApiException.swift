import Foundation
import CoreNetwork
import CoreDomain

public extension ApiException {

    var asRepositoryError: RepositoryError {
        switch self {

        case .network:
            return .unavailable

        case .server:
            return .unavailable

        case .client(_, .notFound):
            return .notFound

        case .client(_, .unauthorized),
             .client(_, .forbidden):
            return .accessDenied

        case .client(_, .tooManyRequests):
            return .rateLimited

        case .decoding,
             .invalidResponse:
            return .invalidData

        default:
            return .unknown
        }
    }
}
