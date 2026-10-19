import Foundation

struct JikanAnimeListResponse: Decodable, Sendable {
    let list: [JikanAnimeResponse]
    let meta: JikanMetaResponse

    enum CodingKeys: String, CodingKey {
        case list = "data"
        case meta
    }
}
