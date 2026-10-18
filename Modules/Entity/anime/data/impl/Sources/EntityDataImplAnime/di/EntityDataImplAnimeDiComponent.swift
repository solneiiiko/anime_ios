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
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil

        return AnimeRemoteDataSource(
            apiClient: ApiClient( // TODO in dependencies
                baseURL: URL(string: "https://jikan.lucashdo.com")!,
                session: URLSession(configuration: configuration),
            )
        )
    }
}
