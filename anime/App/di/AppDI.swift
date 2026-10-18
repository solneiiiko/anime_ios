import Foundation
import CoreDI
import Navigator
import CatalogFeature

enum AppDI {
    
    private static var isInitialized = false

    static func initialize(
        navigator: Navigator<AppTab, Route>,
    ) {
        guard !isInitialized else {
            assertionFailure("AppDI is already initialized... >_<")
            return
        }
        isInitialized = true
        CatalogDiComponentFactory.initialize {
            CatalogDependenciesImpl(
                onNavigate: { route in
                    navigator.navigate(
                        route: .catalogRoute(route: route)
                    )
                }
            )
        }
    }
}

private struct CatalogDependenciesImpl: CatalogDependencies {
    let onNavigate: (CatalogRoute) -> Void
}

