//
//  FullScreenErrorView.swift
//  anime
//
//  Created by Oks on 19/9/2026.
//

import SwiftUI

public struct FullScreenErrorView: View {
    
    private let title: LocalizedStringResource
    private let subtitle: LocalizedStringResource?
    private let button: ButtonInfo
    
    public init(
        title: LocalizedStringResource,
        subtitle: LocalizedStringResource? = nil,
        button: ButtonInfo,
    ) {
        self.title = title
        self.subtitle = subtitle
        self.button = button
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Spacer()
            
            Image(.error)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            Text(title)
                .lineLimit(1)
                .foregroundStyle(AppColors.destructive)
                .font(.title.bold())

            if let subtitle {
                Text(subtitle)
                    .lineLimit(3)
                    .foregroundStyle(AppColors.textSecondary)
                    .font(.subheadline)
            }
            
            Spacer()
                       
            Button {
                button.action()
            } label: {
                Text(button.title)
                    .lineLimit(1)
                    .foregroundStyle(AppColors.textOnDestructive)
                    .font(.title2)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 40
                    )
            }
            .tint(AppColors.destructive)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    FullScreenErrorView(
        title: "Something went wrong",
        subtitle: "Something went wrong",
        button: ButtonInfo(
            title: "Retry",
            action: { /* Nothing to do. All right. */ }
        )
    )
}
