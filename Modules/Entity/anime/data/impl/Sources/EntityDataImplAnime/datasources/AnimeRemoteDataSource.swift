import Foundation
import CoreNetwork

struct AnimeRemoteDataSource: Sendable {

    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func fetchTopAnime() async -> ApiResult<JikanAnimeListResponse> {
        await apiClient.execute(path: "/v1/top/anime")
    }
}
