//
//  AppImages.swift
//  DesignSystem
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

public enum AppImages: String {
    case placeholder = "Placeholder"
    case error = "Error"

    public var image: Image { Image(rawValue, bundle: .module) }
}
