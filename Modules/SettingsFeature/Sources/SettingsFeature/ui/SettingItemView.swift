//
//  SettingItemView.swift
//  SettingsFeature
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

struct SettingItemView: View {
    private let item: SettingItem
    
    init(
        item: SettingItem
    ) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            
            if let description = item.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    SettingItemView(
        item: SettingItem(
            id: 1,
            title: "Setting 1",
            description: "Description for setting 1"
        )
    )
}
