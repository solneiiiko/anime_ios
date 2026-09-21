//
//  CatalogView.swift
//  CatalogFeature
//
//  Created by Oks on 19/9/2026.
//

import SwiftUI

public struct CatalogView: View {
    
    private let catalogItems: [CatalogItem] = (1...100).map { index in
        CatalogItem(
            id: CatalogItem.Id.anime(animeId: index),
            title: "CatalogItem \(index)",
            subtitle: "Subtitle for Item \(index)",
        )
    }
    
    private let onNavigate: (CatalogRoute) -> Void
    
    public init(
        onNavigate: @escaping (CatalogRoute) -> Void,
    ) {
        self.onNavigate = onNavigate
    }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16
            ) {
                ForEach(catalogItems) { item in
                    CatalogItemView(
                        item: item,
                    )
                    .onTapGesture {
                        switch item.id {
                        case .anime(let animeId):
                            onNavigate(.animeDetails(id: animeId))
                        }
                    }
                }
            }
            .padding(
                .horizontal, 16,
            )
            .padding(
                .vertical, 8
            )
        }
    }
}

#Preview {
    CatalogView(onNavigate: { _ in
        /* Nothing to do. All right. */
    })
}
