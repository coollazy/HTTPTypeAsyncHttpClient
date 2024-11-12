import Foundation
import HTTPType
import AsyncHTTPClient

public extension HTTPRequest {
    func transformHTTPClientRequest() throws -> HTTPClientRequest {
        guard let url else {
            throw HTTPTypeAsyncHttpClientError.transformRequestFailed
        }
        
        // 轉換成 HTTPClientRequest
        var clientRequest = HTTPClientRequest(url: url.absoluteString)
        clientRequest.headers = httpHeaders
        clientRequest.method = httpMethod
        if let body {
            clientRequest.body = .bytes(.init(data: body))
        }
        else {
            clientRequest.body = .none
        }
        
        return clientRequest
    }
}
