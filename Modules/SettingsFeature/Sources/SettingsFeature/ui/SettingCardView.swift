//
//  SettingCardView.swift
//  SettingsFeature
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

struct SettingCardView: View {
    
    // TODO get from ViewModel
    private let settingItem: SettingItem
    
    init(id: Int) {
        self.settingItem = SettingItem(
            id: id,
            title: "Title for Setting \(id)",
            description: "Description for Setting \(id)",
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(settingItem.id)")
                .font(.headline)
            
            if let description = settingItem.description {
                Text(description)
                    .font(.body)
            }
        }
        .padding()
        .navigationTitle(settingItem.title)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#Preview {
    SettingCardView(
        id: 1,
    )
}
