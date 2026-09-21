//
//  SettingsRoute.swift
//  SettingsFeature
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

public enum SettingsRoute: Hashable {
    case internalDestination(Destination)
    
    public struct Destination: Hashable {
        let route: InternalRoute

        @ViewBuilder
        public func destinationView() -> some View {
            switch route {
            case .settingCard(let id):
                SettingCardView(id: id)
            }
        }
    }
    
    public enum InternalRoute: Hashable {
        case settingCard(id: Int)
    }
}
