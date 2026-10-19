import Foundation

enum CatalogIntent {
    case onAppear
    case retryClick
    case itemClick(CatalogItem.Id)
}
