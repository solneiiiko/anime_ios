//
//  AnimeApp.swift
//  anime
//
//  Created by Oks on 2/9/2026.
//

import SwiftUI
import DesignSystem
import Navigator

@main
struct AnimeApp: App {
    
    @State private var navigator: Navigator<AppTab, Route>
    
    init() {
        navigator = Navigator<AppTab, Route>(selectedTab: .catalog)
        AppDI.initialize(navigator: navigator)
    }
    
    var body: some Scene {
        WindowGroup {
            RootTabView(navigator: navigator).tint(AppColors.accent)
        }
    }
}
