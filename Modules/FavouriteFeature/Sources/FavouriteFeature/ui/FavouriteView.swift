//
//  FavouriteView.swift
//  FavouriteFeature
//
//  Created by Oks on 19/9/2026.
//

import SwiftUI
import DesignSystem

public struct FavouriteView: View {
    
    private let onNavigate: (FavouriteRoute) -> Void

    public init(
        onNavigate: @escaping (FavouriteRoute) -> Void,
    ) {
        self.onNavigate = onNavigate
    }

    public var body: some View {
        VStack {
            Spacer()
            Text("I'm Favourite")
            Spacer()
            Button("Go to Catalog") {
                onNavigate(.catalog)
            }
            .tint(AppColors.accent)
            .buttonStyle(.borderedProminent)
        }
        .padding(.bottom, 32)
    }
}

#Preview {
    FavouriteView(onNavigate: { _ in
        /* Nothing to do. All right. */
    })
}
