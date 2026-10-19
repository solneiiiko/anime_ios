import SwiftUI
import DesignSystem

struct CatalogItemView: View {
    private let item: CatalogItem
    
    init (item: CatalogItem) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            imageView
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .clipped()
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundStyle(AppColors.textPrimary)

                Text(item.subtitle)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundStyle(AppColors.textSecondary)
            }
            .frame(alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }

    @ViewBuilder
    private var imageView: some View {
        if let imageUrl = item.imageUrl,
           let url = URL(string: imageUrl) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    AppImages.placeholder.image
                        .resizable()
                        .scaledToFill()
                        .shimmer()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()

                case .failure:
                    AppImages.placeholder.image
                        .resizable()
                        .scaledToFill()
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            AppImages.placeholder.image
                .resizable()
                .scaledToFill()
        }
    }
}

#Preview {
    CatalogItemView(
        item: CatalogItem(
            id: .anime(animeId: 1),
            title: "CatalogItem 1",
            subtitle: "Subtitle for Item 1.",
            imageUrl: nil,
        )
    )
}

#Preview {
    CatalogItemView(
        item: CatalogItem(
            id: .anime(animeId: 1),
            title: "CatalogItem 1",
            subtitle: "Subtitle for Item 1.",
            imageUrl: nil,
        )
    )
    .environment(\.dynamicTypeSize, .accessibility3)
}
