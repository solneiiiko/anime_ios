//
//  AnimeApp.swift
//  anime
//
//  Created by Oks on 2/9/2026.
//

import SwiftUI
import DesignSystem

@main
struct AnimeApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView().tint(AppColors.accent)
        }
    }
}
