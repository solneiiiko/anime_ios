import Foundation
import CoreNetwork
import CoreDomain
import CoreRepository
import EntityDomainApiAnime

public final class AnimeRepositoryImpl: AnimeRepository {

    private let dataSource: AnimeRemoteDataSource

    init(dataSource: AnimeRemoteDataSource) {
        self.dataSource = dataSource
    }

    public func fetchTopAnime() async -> Result<[AnimeShort], RepositoryError> {
        let result = await dataSource.fetchTopAnime()
        return result
            .map { $0.asAnimeShortList }
            .mapError { $0.asRepositoryError }
    }
}
