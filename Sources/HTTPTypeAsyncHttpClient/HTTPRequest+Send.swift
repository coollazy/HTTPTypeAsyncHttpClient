import HTTPType

public extension HTTPRequest {
    func send() async throws -> HTTPResponse {
        try await Client.shared.send(self)
    }
    
    func send(client: Client) async throws -> HTTPResponse {
        try await client.send(self)
    }
}
