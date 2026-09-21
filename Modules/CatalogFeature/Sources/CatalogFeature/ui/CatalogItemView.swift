//
//  CatalogItemView.swift
//  CatalogFeature
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI
import DesignSystem

struct CatalogItemView: View {
    private let item: CatalogItem
    
    init (item: CatalogItem) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // TODO get image by URL from item.imageURL
            AppImages.placeholder.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(item.title)
                .lineLimit(1)
                .font(.headline)
                .foregroundStyle(AppColors.textPrimary)

            Text(item.subtitle)
                .lineLimit(1)
                .font(.subheadline)
                .foregroundStyle(AppColors.textSecondary)
        }
    }
}

#Preview {
    CatalogItemView(
        item: CatalogItem(
            id: .anime(animeId: 1),
            title: "CatalogItem 1",
            subtitle: "Subtitle for Item 1.")
    )
}
