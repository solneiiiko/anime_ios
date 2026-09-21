//
//  TopNavButton.swift
//  Navigator
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

public struct TopNavButton<ID : Hashable> : Identifiable {
    public let id: ID
    public let title: String
    public let icon: String
    
    public init(
        id: ID,
        title: String,
        icon: String
    ) {
        self.id = id
        self.title = title
        self.icon = icon
    }
}
