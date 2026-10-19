import Foundation

struct JikanPaginationResponse: Decodable, Sendable {
    let page: Int
    let limit: Int
    let hasNextPage: Bool
}
