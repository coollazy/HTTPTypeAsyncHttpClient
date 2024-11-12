import HTTPType
import AsyncHTTPClient
import NIOCore
import Logging

extension HTTPClient {
    public func execute(_ request: HTTPType.HTTPRequest, timeout: TimeAmount, logger: Logger? = nil) async throws -> HTTPType.HTTPResponse {
        try await execute(try request.transformHTTPClientRequest(), timeout: timeout, logger: logger)
            .toResponse()
    }
}
