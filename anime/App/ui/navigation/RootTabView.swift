import SwiftUI
import DesignSystem
import Navigator


struct RootTabView: View {

    private let coordinator: RootCoordinator
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

    init(
        coordinator: RootCoordinator,
    ) {
        self.coordinator = coordinator
        self.navigator = coordinator.navigator
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
                        coordinator.rootView(for: button.id)
                        .navigationDestination(for: Route.self) { route in
                            coordinator.destinationView(for: route)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let appComponent = AppComponent()
    RootTabView(
        coordinator: appComponent.rootCoordinator
    )
}
