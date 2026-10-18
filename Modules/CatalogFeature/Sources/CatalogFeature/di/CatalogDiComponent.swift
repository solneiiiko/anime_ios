import Foundation
import CoreDI

public final class CatalogDiComponent: DiComponent {

    public typealias DEPENDENCIES = CatalogDependencies

    private let dependencies: CatalogDependencies
    
    private var viewModel: CatalogViewModel? = nil

    public init(dependencies: CatalogDependencies) {
        self.dependencies = dependencies
    }

    @MainActor
    func makeRootView() -> CatalogView {
        CatalogView(getCatalogViewModel())
    }
    
    @MainActor
    private func getCatalogViewModel() -> CatalogViewModel {
        if let viewModel = viewModel {
            return viewModel
        }
        
        let viewModel = CatalogViewModel(
            onNavigate: dependencies.onNavigate,
            animeRepository: dependencies.animeRepository
        )
        
        self.viewModel = viewModel
        
        return viewModel
    }
}
