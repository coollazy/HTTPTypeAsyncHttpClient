import HTTPType

class AdditionHeaderMiddleware: Middleware {
    var headers = [String: String]()
    
    func prepare(request: inout HTTPRequest) {
        request.headers = request.headers.merging(headers) { $1 }
    }
}
