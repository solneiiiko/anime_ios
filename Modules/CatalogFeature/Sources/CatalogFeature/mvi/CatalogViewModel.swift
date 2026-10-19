import Foundation
import Observation
import CoreMVI
import CoreDomain
import CorePresentation
import DesignSystem
import EntityDomainApiAnime

@Observable
final class CatalogViewModel: MVIViewModel {

    private(set) var state: CatalogState = .loading

    @ObservationIgnored
    private let onNavigate: (CatalogRoute) -> Void
    
    @ObservationIgnored
    private let numberFormatter: AppNumberFormatter
    
    @ObservationIgnored
    private let animeRepository: AnimeRepository

    @ObservationIgnored
    private var loadTask: Task<Void, Never>?
    
    @ObservationIgnored
    private var didRequestInitialLoad = false
        
    init(
        onNavigate: @escaping (CatalogRoute) -> Void,
        animeRepository: AnimeRepository,
        numberFormatter: AppNumberFormatter = AppNumberFormatter()
    ) {
        self.onNavigate = onNavigate
        self.animeRepository = animeRepository
        self.numberFormatter = numberFormatter
    }
    
    func send(_ intent: CatalogIntent) {
        switch intent {
        case .onAppear:
            tryLoadCatalog()
        case .retryClick:
            tryLoadCatalog(isForce: true)
        case .itemClick(let itemId):
            handleItemClick(itemId)
        }
    }
    
    private func tryLoadCatalog(isForce: Bool = false) {
      guard isForce || !didRequestInitialLoad else { return }
        didRequestInitialLoad = true
        
        loadTask?.cancel()
        loadTask = Task { [weak self] in
            guard let self else { return }
            guard !Task.isCancelled else { return }
            state = .loading
            let apiResult = await animeRepository.fetchTopAnime()
            
            guard !Task.isCancelled else { return }

            switch apiResult {
            case .success(let items):
                state = .content(items: items.asCatalogItems(numberFormatter: numberFormatter))
            case .failure(let error):
                state = .failed(error: error.asUiError)
            }
        }
    }
    
    private func handleItemClick(_ itemId: CatalogItem.Id) {
        switch itemId {
        case .anime(let animeId):
            onNavigate(.animeDetails(id: animeId))
        }
    }
    
    deinit {
        loadTask?.cancel()
    }
}
