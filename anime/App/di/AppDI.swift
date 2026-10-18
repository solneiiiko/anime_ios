import Foundation
import CoreDI
import Navigator
import CatalogFeature
import EntityDomainApiAnime
import EntityDataImplAnime

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

        EntityDataImplAnimeDiComponentFactory.initialize {
            EntityDataImplAnimeDependenciesImpl()
        }
        let entityDataImplAnimeApi: EntityDataImplAnimeApi = EntityDataImplAnimeDiComponentFactory.createComponent()

        CatalogDiComponentFactory.initialize {
            CatalogDependenciesImpl(
                onNavigate: { route in
                    navigator.navigate(
                        route: .catalogRoute(route: route)
                    )
                },
                animeRepository: entityDataImplAnimeApi.animeRepository
            )
        }
    }
}

private struct CatalogDependenciesImpl: CatalogDependencies {
    let onNavigate: (CatalogRoute) -> Void
    let animeRepository: AnimeRepository
}

private struct EntityDataImplAnimeDependenciesImpl: EntityDataImplAnimeDependencies {
    
}


