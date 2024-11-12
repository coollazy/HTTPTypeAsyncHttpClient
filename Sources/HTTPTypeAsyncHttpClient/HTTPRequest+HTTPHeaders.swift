import HTTPType
import NIOHTTP1

public extension HTTPRequest {
    var httpHeaders: HTTPHeaders {
        HTTPHeaders(headers.map({ ($0.key, $0.value) }))
    }
    
    var httpMethod: HTTPMethod {
        switch method {
        case .GET:
            .GET
        case .POST:
            .POST
        case .PUT:
            .PUT
        case .PATCH:
            .PATCH
        case .DELETE:
            .DELETE
        case .HEAD:
            .HEAD
        case .OPTIONS:
            .OPTIONS
        }
    }
}
