import Foundation
import EntityDomainApiAnime
import CorePresentation

extension Array where Element == AnimeShort {

    func asCatalogItems(
        numberFormatter: AppNumberFormatter,
    ) -> [CatalogItem] {
        map {
            CatalogItem(
                id: CatalogItem.Id.anime(animeId: $0.id),
                title: $0.title,
                subtitle: $0.catalogSubtitle(
                    numberFormatter: numberFormatter,
                ),
                imageUrl: $0.imageUrl
            )
        }
    }
}

private extension AnimeShort {

    func catalogSubtitle(
        numberFormatter: AppNumberFormatter
    ) -> String {
        var parts: [String] = []
        if let type {
            parts.append("\(type)(\(episodes.map(String.init) ?? "?"))")
        } else if let episodes {
            parts.append("\(episodes)")
        }
        if let score, score >= 1 {
            parts.append("\(numberFormatter.formatScore(score))")
        }
        if let members {
            parts.append("\(numberFormatter.formatCommon(members))")
        }

        return parts.joined(separator: " • ")
    }
}
