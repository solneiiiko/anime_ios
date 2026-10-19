import Foundation
import DesignSystem

enum CatalogState {
    case loading
    case content(items: [CatalogItem])
    case failed(error: UiError)
}
