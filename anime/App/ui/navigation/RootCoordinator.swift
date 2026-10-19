import SwiftUI
import CatalogFeature
import AnimeDetailsFeature
import FavouriteFeature
import SettingsFeature
import Navigator

@MainActor
final class RootCoordinator {

    let navigator: Navigator<AppTab, Route>

    private let makeCatalogView: () -> CatalogEntryView
    private let makeAnimeDetailsView: (Int) -> AnimeDetailsView

    init(
        navigator: Navigator<AppTab, Route>,
        makeCatalogView: @escaping () -> CatalogEntryView,
        makeAnimeDetailsView: @escaping (Int) -> AnimeDetailsView,
    ) {
        self.navigator = navigator
        self.makeCatalogView = makeCatalogView
        self.makeAnimeDetailsView = makeAnimeDetailsView
    }

    @ViewBuilder
    func rootView(for tab: AppTab) -> some View {
        switch tab {
        case .catalog:
            makeCatalogView()
        case .favourites:
            FavouriteView(
                onNavigate: { [navigator] route in
                    if route == .catalog {
                        navigator.navigate(tab: .catalog)
                    }
                }
            )
        case .more:
            SettingsView(
                onNavigate: { [navigator] route in
                    navigator.navigate(
                        route: .settingsRoute(route: route)
                    )
                }
            )
        }
    }

    @ViewBuilder
    func destinationView(for route: Route) -> some View {
        switch route {
        case .catalogRoute(let catalogRoute):
            switch catalogRoute {
            case .animeDetails(let animeId):
                makeAnimeDetailsView(animeId)
            }
        case .favouriteRoute(let favouriteRoute):
            switch favouriteRoute {
            case .catalog:
                // TODO prod -> empty view && internal -> crash
                EmptyView()
            }
        case .settingsRoute(let settingsRoute):
            switch settingsRoute {
            case .internalDestination(let destination):
                destination.destinationView()
            }
        }
    }
}
