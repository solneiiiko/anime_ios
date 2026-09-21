//
//  AppIcons.swift
//  DesignSystem
//
//  Created by Oks on 21/9/2026.
//

import Foundation

public enum AppIcons: String {
    case catalog = "house.fill"
    case favourites = "heart"
    case more = "line.3.horizontal"

    public var systemImage: String { rawValue }
}
