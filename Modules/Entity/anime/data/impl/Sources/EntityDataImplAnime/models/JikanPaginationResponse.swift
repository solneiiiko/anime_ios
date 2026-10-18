import Foundation

struct JikanPaginationResponse: Decodable {
    let page: Int
    let limit: Int
    let hasNextPage: Bool
}
