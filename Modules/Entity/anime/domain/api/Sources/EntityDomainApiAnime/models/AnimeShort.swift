import Foundation

public struct AnimeShort: Sendable {
    public let id: Int
    public let title: String
    public let imageUrl: String?
    public let type: String?
    public let score: Double?
    public let members: Int?
    public let episodes: Int?

    public init(
        id: Int,
        title: String,
        imageUrl: String?,
        type: String?,
        score: Double?,
        members: Int?,
        episodes: Int?
    ) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.type = type
        self.score = score
        self.members = members
        self.episodes = episodes
    }
}
