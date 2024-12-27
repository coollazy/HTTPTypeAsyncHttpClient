import HTTPType
import AsyncHTTPClient

public class Client: Session {
    public static var shared = Client()
    
    private var session: HTTPClient
    private var additionHeaderMiddleware = AdditionHeaderMiddleware()
    public var middlewares: [Middleware] = []
    
    public init(configuration: HTTPClient.Configuration = HTTPClient.Configuration()) {
        var configure = HTTPClient.Configuration()
        configure.decompression = .enabled(limit: .none)
        self.session = .init(
            eventLoopGroupProvider: .singleton,
            configuration: configure
        )
        
        self.middlewares = [additionHeaderMiddleware]
    }
    
    public func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        var request = request
        middlewares.forEach {
            $0.prepare(request: &request)
        }
        var response = try await HTTPClient.shared.execute(request, timeout: .seconds(30))
        middlewares.forEach {
            $0.didRevice(request: &request, response: &response)
        }
        return response
    }
    
    public func appendAdditionalHeader(_ key: String, value: String) {
        additionHeaderMiddleware.headers[key] = value
    }
    
    public var additionalHeader: [String: String]? {
        additionHeaderMiddleware.headers
    }
    
    deinit {
        _ = session.shutdown()
    }
}
