import SwiftUI
import DesignSystem

struct CatalogView: View {
    
    private let viewModel: CatalogViewModel

    init(_ viewModel: CatalogViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                CatalogSkeletonView()
            case .content(let items):
                ScrollView {
                    LazyVGrid(
                        columns: Array(
                            repeating: GridItem(.flexible(), spacing: 16),
                            count: 2
                        ),
                        alignment: .leading,
                        spacing: 16,
                    ) {
                        ForEach(items) { item in
                            Button {
                                viewModel.send(.itemClick(item.id))
                            } label: {
                                CatalogItemView(item: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(
                        .horizontal, 16,
                    )
                    .padding(
                        .vertical, 8,
                    )
                }
            case .failed(let error):
                FullScreenErrorView(
                    title: error.title,
                    subtitle: error.subtitle,
                    button: ButtonInfo(
                        title: Strings.retryButton,
                        action: {
                            viewModel.send(.retryClick)
                        }
                    )
                )
            }
        }
        .onAppear {
            viewModel.send(.onAppear)
        }
    }
}
