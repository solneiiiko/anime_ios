//
//  ButtonInfo.swift
//  anime
//
//  Created by Oks on 19/9/2026.
//

import Foundation

public struct ButtonInfo {
    public let title: LocalizedStringResource
    public let action: () -> Void
    
    public init(
        title: LocalizedStringResource,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
}
