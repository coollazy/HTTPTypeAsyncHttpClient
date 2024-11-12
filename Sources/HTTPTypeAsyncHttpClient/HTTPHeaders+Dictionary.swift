import NIOHTTP1

public extension HTTPHeaders {
    var dictionary: [String: String] {
        var dictionary = [String: String]()
        forEach { (name, value) in
            dictionary[name] = value
        }
        
        return dictionary
    }
}
