import Foundation

public protocol CatalogDependencies {

    var onNavigate: (CatalogRoute) -> Void { get }
}
