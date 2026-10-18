import Foundation
import CoreNetwork
import CoreDI
import EntityDomainApiAnime

public final class EntityDataImplAnimeDiComponent: DiComponent, EntityDataImplAnimeApi {

    public typealias DEPENDENCIES = EntityDataImplAnimeDependencies

    public let animeRepository: AnimeRepository

    public init(dependencies: EntityDataImplAnimeDependencies) {
        self.animeRepository = AnimeRepositoryImpl(dataSource: EntityDataImplAnimeDiComponent.makeDataSource())
    }
    
    private static func makeDataSource() -> AnimeRemoteDataSource {
        AnimeRemoteDataSource(
            apiClient: ApiClient(
                baseURL: URL(string: "https://jikan.lucashdo.com")! // TODO in dependencies
            )
        )
    }
}
