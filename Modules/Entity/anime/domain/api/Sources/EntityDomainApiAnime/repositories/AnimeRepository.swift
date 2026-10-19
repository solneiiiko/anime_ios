import Foundation
import CoreDomain

public protocol AnimeRepository: Sendable {

    func fetchTopAnime() async -> Result<[AnimeShort], RepositoryError>
}
