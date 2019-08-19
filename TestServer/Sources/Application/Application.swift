import Kitura

struct User: Codable {
    let name: String
}

struct Banana: Codable {
    let banana: String
}

public class App {
    let router = Router()

    public init() throws {
        // Simple route that always returns a RequestError
        router.get("/error") {
            (respondWith: (User?, RequestError?) -> Void) in
            let baseError = RequestError(rawValue: 500, reason: "Bananas Detected")
            let myError = RequestError(baseError, body: Banana(banana: "Yellow"))
            respondWith(nil, myError)
        }
    }

    public func run() throws {
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
