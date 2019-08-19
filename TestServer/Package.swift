// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "TestServer",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.7.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
    ],
    targets: [
      .target(name: "TestServer", dependencies: [ .target(name: "Application"), "HeliumLogger" ]),
      .target(name: "Application", dependencies: [ "Kitura" ]),
    ]
)
