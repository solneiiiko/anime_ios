
public typealias ApiResult<Value> = Result<Value, ApiException>

public enum ApiException: Error {

    case network(
        message: String
    )

    case client(
        message: String,
        code: ClientCode
    )

    case server(
        message: String,
        statusCode: Int
    )

    case decoding(
        message: String
    )

    case invalidResponse

    case cancelled

    case unknown(
        message: String
    )
    
    public enum ClientCode {
        case badRequest
        case unauthorized
        case forbidden
        case notFound
        case conflict
        case tooManyRequests
        case unknown
    }
}
