import Foundation

public enum RepositoryError: Error, Sendable {
    case notFound
    case accessDenied
    case rateLimited
    case unavailable
    case invalidData
    case unknown
}
