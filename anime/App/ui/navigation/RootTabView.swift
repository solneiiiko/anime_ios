//
//  RootTabView.swift
//  anime
//
//  Created by Oks on 19/9/2026.
//

import SwiftUI
import CatalogFeature
import AnimeDetailsFeature
import FavouriteFeature
import SettingsFeature
import DesignSystem
import Navigator


struct RootTabView: View {
    
    @State private var navigator = Navigator<AppTab, Route>(selectedTab: .catalog)
    
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
            CatalogView(
                onNavigate: { route in
                    navigator.navigate(route: .catalogRoute(route: route))
                }
            )
        case .favourites:
            FavouriteView(
                onNavigate: { route in
                    if route == .catalog {
                        navigator.navigate(tab: AppTab.catalog)
                    }
                }
            )
        case .more:
            SettingsView()
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
        }
    }
}

#Preview {
    RootTabView()
}
