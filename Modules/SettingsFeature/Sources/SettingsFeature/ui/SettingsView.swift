//
//  SettingsView.swift
//  SettingsFeature
//
//  Created by Oks on 19/9/2026.
//

import SwiftUI

public struct SettingsView: View {

    private let settings: [SettingItem] = (1...10).map {
        SettingItem(
            id: $0,
            title:"Setting \($0)",
            description: "Description for setting \($0)",
        )
    }
    
    private let onNavigate: (SettingsRoute) -> Void

    public init(
        onNavigate: @escaping (SettingsRoute) -> Void
    ) {
        self.onNavigate = onNavigate
    }

    public var body: some View {
        List {
            ForEach(settings) { setting in
                SettingItemView(item: setting)
                    .onTapGesture {
                        onNavigate(
                            .internalDestination(
                                SettingsRoute.Destination(
                                    route: .settingCard(id: setting.id)
                                )
                            )
                        )
                    }
            }
        }
    }
}

#Preview {
    SettingsView(onNavigate: { _ in
        /* Nothing to do. All right. */
    })
}
