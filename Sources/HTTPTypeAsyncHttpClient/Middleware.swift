import HTTPType

public protocol Middleware {
    func prepare(request: inout HTTPRequest)
    func didRevice(request: inout HTTPRequest, response: inout HTTPResponse)
}

public extension Middleware {
    func prepare(request: inout HTTPRequest) {}
    func didRevice(request: inout HTTPRequest, response: inout HTTPResponse) {}
}
