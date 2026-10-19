import Foundation

@MainActor
public final class CatalogDiComponent {

    private let dependencies: CatalogDependencies

    private lazy var viewModel = CatalogViewModel(
        onNavigate: dependencies.onNavigate,
        animeRepository: dependencies.animeRepository
    )

    public init(dependencies: CatalogDependencies) {
        self.dependencies = dependencies
    }

    func makeRootView() -> CatalogView {
        CatalogView(viewModel)
    }
}
