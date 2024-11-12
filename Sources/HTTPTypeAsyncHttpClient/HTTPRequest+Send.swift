import HTTPType

public extension HTTPRequest {
    func send() async throws -> HTTPResponse {
        try await Client.shared.send(self)
    }
}
