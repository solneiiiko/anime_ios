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
    
    public init() {
        // Nothing to do. All right.
    }

    public var body: some View {
        List {
            ForEach(settings) { setting in
                NavigationLink {
                    SettingCardView(id: setting.id)
                } label: {
                    SettingItemView(item: setting)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
