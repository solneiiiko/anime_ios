import Foundation

public struct ApiClient: Sendable {

    private let baseURL: URL
    
    private let session: URLSession

    public init(
        baseURL: URL,
        session: URLSession,
    ) {
        self.baseURL = baseURL
        self.session = session
    }
    
    public func execute<Response: Decodable>(
        path: String,
    ) async -> ApiResult<Response> {
        let url = baseURL.appending(path: path)
        let request = URLRequest(url: url)
        return await execute(request)
    }

    private func execute<Response : Decodable>(
        _ request: URLRequest,
    ) async -> ApiResult<Response> {
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                return .failure(
                    Self.apiException(
                        statusCode: httpResponse.statusCode,
                        message: HTTPURLResponse.localizedString(
                            forStatusCode: httpResponse.statusCode
                        )
                    )
                )
            }
            do {
                let response = try JSONDecoder()
                    .decode(Response.self, from: data)
                return .success(response)
            } catch {
                return .failure(
                    .decoding(
                        message: error.localizedDescription
                    )
                )
            }
        } catch let error as URLError
            where error.code == .cancelled {
            return .failure(.cancelled)
        } catch let error as URLError {
            return .failure(
                .network(
                    message: error.localizedDescription
                )
            )
        } catch {
            return .failure(
                .unknown(
                    message: error.localizedDescription
                )
            )
        }
    }
}

private extension ApiClient {

    static func apiException(
        statusCode: Int,
        message: String
    ) -> ApiException {
        switch statusCode {
        case 400...499:
            return .client(
                message: message,
                code: clientCode(statusCode)
            )
        case 500...599:
            return .server(
                message: message,
                statusCode: statusCode
            )
        default:
            return .unknown(
                message: "Unexpected HTTP status code: \(statusCode)"
            )
        }
    }

    static func clientCode(
        _ statusCode: Int
    ) -> ApiException.ClientCode {
        switch statusCode {
        case 400:
            .badRequest
        case 401:
            .unauthorized
        case 403:
            .forbidden
        case 404:
            .notFound
        case 409:
            .conflict
        case 429:
            .tooManyRequests
        default:
            .unknown
        }
    }
}
