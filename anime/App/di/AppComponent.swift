import Foundation
import CoreNetwork
import Navigator
import CatalogFeature
import AnimeDetailsFeature
import EntityDomainApiAnime
import EntityDataImplAnime

@MainActor
final class AppComponent {

    let navigator: Navigator<AppTab, Route> = Navigator<AppTab, Route>(selectedTab: .catalog)

    private lazy var animeDataComponent: EntityDataImplAnimeDiComponent =
        EntityDataImplAnimeDiComponent(
            dependencies: EntityDataImplAnimeDependencies(
                apiClient: makeApiClient()
            )
        )

    lazy var rootCoordinator: RootCoordinator = RootCoordinator(
        navigator: navigator,
        makeCatalogView: { [unowned self] in
            CatalogEntryView(
                dependencies: self.catalogDependencies
            )
        },
        makeAnimeDetailsView: { [unowned self] id in
            AnimeDetailsView(
                id: id,
            )
        }
    )

    private var catalogDependencies: CatalogDependencies {
        CatalogDependencies(
            animeRepository: animeDataComponent.animeRepository,
            onNavigate: { [navigator] route in
                navigator.navigate(
                    route: .catalogRoute(route: route)
                )
            }
        )
    }

    private var animeDetailsDependencies: AnimeDetailsDependencies {
        AnimeDetailsDependencies(
            animeRepository: animeDataComponent.animeRepository
        )
    }

    private func makeApiClient() -> ApiClient {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil

        return ApiClient(
            baseURL: URL(string: "https://jikan.lucashdo.com")!,
            session: URLSession(configuration: configuration)
        )
    }
}

