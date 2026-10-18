import SwiftUI
import CatalogFeature
import AnimeDetailsFeature
import FavouriteFeature
import SettingsFeature
import DesignSystem
import Navigator


struct RootTabView: View {
    
    @Bindable private var navigator: Navigator<AppTab, Route>
    
    // TODO get from ViewModel
    private let topNavButtons: [TopNavButton<AppTab>] = [
        TopNavButton(
            id: .catalog,
            title: Strings.tabCatalog,
            icon: AppIcons.catalog.systemImage
        ),
        TopNavButton(
            id: .favourites,
            title: Strings.tabFavourites,
            icon: AppIcons.favourites.systemImage
        ),
        TopNavButton(
            id: .more,
            title: Strings.tabMore,
            icon: AppIcons.more.systemImage
        ),
    ]
    
    init(navigator: Navigator<AppTab, Route>) {
        self.navigator = navigator
    }
    
    var body: some View {
        TabView(selection: $navigator.selectedTab) {
            ForEach(topNavButtons) { button in
                Tab(
                    button.title,
                    systemImage: button.icon,
                    value: button.id,
                ) {
                    NavigationStack(path: navigator.navPath(tab: button.id)) {
                        rootView(tab: button.id)
                        .navigationDestination(for: Route.self) { route in
                            destinationView(route: route)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func rootView(tab: AppTab) -> some View {
        switch tab {
        case .catalog:
            CatalogEntryView()
        case .favourites:
            FavouriteView(
                onNavigate: { route in
                    if route == .catalog {
                        navigator.navigate(tab: AppTab.catalog)
                    }
                }
            )
        case .more:
            SettingsView(
                onNavigate: { route in
                    navigator.navigate(route: .settingsRoute(route: route))
                }
            )
        }
    }
    
    @ViewBuilder
    private func destinationView(route: Route) -> some View {
        switch route {
        case .catalogRoute(let catalogRoute):
            switch catalogRoute {
            case .animeDetails(let animeId):
                AnimeDetailsView(id: animeId)
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

#Preview {
    RootTabView(navigator: Navigator<AppTab, Route>(selectedTab: .favourites))
}
