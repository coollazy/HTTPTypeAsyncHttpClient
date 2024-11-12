import HTTPType
import AsyncHTTPClient

public class Client: Session {
    static var shared = Client()
    
    private var session: HTTPClient
    
    init() {
        var configure = HTTPClient.Configuration()
        configure.decompression = .enabled(limit: .none)
        self.session = .init(
            eventLoopGroupProvider: .singleton,
            configuration: configure)
    }
    
    public func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        try await HTTPClient.shared.execute(request, timeout: .seconds(30))
    }
    
    deinit {
        _ = session.shutdown()
    }
}
