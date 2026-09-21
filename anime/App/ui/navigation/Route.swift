//
//  Route.swift
//  anime
//
//  Created by Oks on 21/9/2026.
//

import CatalogFeature
import FavouriteFeature

enum Route : Hashable {
    case catalogRoute(route: CatalogRoute)
    case favouriteRoute(route: FavouriteRoute)
}
