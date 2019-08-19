import HeliumLogger
import LoggerAPI
import Application

do {

    HeliumLogger.use(.info)

    let app = try App()
    try app.run()

} catch let error {
    Log.error(error.localizedDescription)
}
