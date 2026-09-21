//
//  AppImages.swift
//  DesignSystem
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

public enum AppImages {
    case placeholder
    case error
    
    public var image: Image {
        switch self {
        case .placeholder:
            Image(.placeholder)
        case .error:
            Image(.error)
        }
    }
}
