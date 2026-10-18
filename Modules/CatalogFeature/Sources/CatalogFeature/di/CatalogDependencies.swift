import Foundation
import EntityDomainApiAnime

public protocol CatalogDependencies {

    var onNavigate: (CatalogRoute) -> Void { get }
    var animeRepository: AnimeRepository { get }
}
