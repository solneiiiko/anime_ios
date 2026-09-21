//
//  CatalogItem.swift
//  CatalogFeature
//
//  Created by Oks on 21/9/2026.
//

import Foundation

struct CatalogItem: Identifiable {
    let id: Id
    let title: String
    let subtitle: String
    let imageUrl: String? = nil
    
    enum Id : Hashable {
        case anime(
            animeId: Int,
        )
    }
}
