import Foundation
import EntityDomainApiAnime

extension JikanAnimeResponse {

    var asAnimeShort: AnimeShort {
        AnimeShort(
            id: id,
            title: title,
            imageUrl: imageUrl,
            type: type,
            score: score,
            members: members,
            episodes: episodes
        )
    }
}

extension JikanAnimeListResponse {

    var asAnimeShortList: [AnimeShort] {
        list.map { $0.asAnimeShort }
    }
}
