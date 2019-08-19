import KituraKit
import KituraContracts
import Dispatch

let client = KituraKit(baseURL: "http://localhost:8080")!

struct User: Codable {
    let name: String
}

struct Banana: Codable {
    let banana: String
}

let sema = DispatchSemaphore(value: 0)

client.get("/error") { (user: User?, error: RequestError?) in
    guard let error = error else {
        return print("Whoops, no error")
    }
    print("Success: error received: \(error)")
    guard let errorBody: Banana = error.bodyAs(Banana.self) else {
        return print("Whoops, no banana")
    }
    print(" - error body: \(errorBody)")
    sema.signal()
}

sema.wait()
