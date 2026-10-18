import Foundation
import CoreDI

public final class CatalogDiComponent: DiComponent {

    public typealias DEPENDENCIES = CatalogDependencies

    private let dependencies: CatalogDependencies

    public init(dependencies: CatalogDependencies) {
        self.dependencies = dependencies
    }

    @MainActor
    func makeRootView() -> CatalogView {
        CatalogView(onNavigate: dependencies.onNavigate) // TODO save viewModel
    }
}
