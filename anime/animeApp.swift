import SwiftUI
import DesignSystem

@main
struct AnimeApp: App {

    private var appComponent = AppComponent()

    var body: some Scene {
        WindowGroup {
            RootTabView(
                coordinator: appComponent.rootCoordinator
            ).tint(AppColors.accent)
        }
    }
}

