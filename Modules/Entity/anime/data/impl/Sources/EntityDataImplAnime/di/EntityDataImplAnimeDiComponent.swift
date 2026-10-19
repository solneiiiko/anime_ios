import Foundation
import CoreNetwork
import EntityDomainApiAnime

public final class EntityDataImplAnimeDiComponent {

    private let dependencies: EntityDataImplAnimeDependencies

    public init(dependencies: EntityDataImplAnimeDependencies) {
        self.dependencies = dependencies
    }

    public lazy var animeRepository: AnimeRepository = AnimeRepositoryImpl(
        dataSource: AnimeRemoteDataSource(
            apiClient: dependencies.apiClient
        )
    )
}
