import Foundation

struct JikanAnimeResponse: Decodable, Sendable {
    let id: Int
    let title: String
    let imageUrl: String?
    let type: String?
    let score: Double?
    let members: Int?
    let episodes: Int?

    enum CodingKeys: String, CodingKey {
        case id = "malId"
        case title
        case imageUrl
        case type
        case score
        case members
        case episodes
    }
}
