import Foundation
import CoreNetwork

public struct EntityDataImplAnimeDependencies {

    public let apiClient: ApiClient

    public init(
        apiClient: ApiClient
    ) {
        self.apiClient = apiClient
    }
}
