import Foundation

struct CatalogItem: Identifiable {
    let id: Id
    let title: String
    let subtitle: String
    let imageUrl: String?
    
    enum Id : Hashable {
        case anime(
            animeId: Int,
        )
    }
}
