import Foundation
import HTTPType
import AsyncHTTPClient
import NIOFoundationCompat

public extension HTTPClientResponse {
    func toResponse() async throws -> HTTPResponse {
        let buffer = try await body.collect(upTo: .max)
        let data = Data(buffer: buffer)
        
        return .init(
            statusCode: status.code,
            headers: headers.dictionary,
            body: data
        )
    }
}
