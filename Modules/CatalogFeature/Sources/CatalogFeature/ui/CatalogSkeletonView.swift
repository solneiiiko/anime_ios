import SwiftUI
import DesignSystem

struct CatalogSkeletonView: View {

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(
                    repeating: GridItem(.flexible(), spacing: 16),
                    count: 2
                ),
                alignment: .leading,
                spacing: 16,
            ) {
                ForEach(0..<CatalogSkeletonConstants.itemsCount, id: \.self) { _ in
                    CatalogSkeletonItemView()
                }
            }
            .padding(
                .horizontal, 16,
            )
            .padding(
                .vertical, 8,
            )
        }
        .scrollDisabled(true)
    }
}

private struct CatalogSkeletonItemView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(AppColors.backgroundSecondary)
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .shimmer()

            VStack(alignment: .leading, spacing: 2) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(AppColors.backgroundSecondary)
                    .frame(height: 18)
                    .frame(maxWidth: .infinity)
                    .shimmer()

                RoundedRectangle(cornerRadius: 8)
                    .fill(AppColors.backgroundSecondary)
                    .frame(height: 14)
                    .frame(maxWidth: .infinity)
                    .shimmer()
            }
            .frame(alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

private enum CatalogSkeletonConstants {
    static let itemsCount = 10
}

#Preview {
    CatalogSkeletonView()
}
