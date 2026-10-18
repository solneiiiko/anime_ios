import Foundation

struct JikanAnimeListResponse: Decodable {
    let list: [JikanAnimeResponse]
    let meta: JikanMetaResponse

    enum CodingKeys: String, CodingKey {
        case list = "data"
        case meta
    }
}
