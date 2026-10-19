import Foundation
import EntityDomainApiAnime

public struct CatalogDependencies {

    public let animeRepository: AnimeRepository
    public let onNavigate: (CatalogRoute) -> Void

    public init(
        animeRepository: AnimeRepository,
        onNavigate: @escaping (CatalogRoute) -> Void
    ) {
        self.animeRepository = animeRepository
        self.onNavigate = onNavigate
    }
}
