// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoPackage",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library( name: "CryptoUIKit",targets: ["CryptoUIKit"]),
        .library( name: "Domain",targets: ["Domain"]),
        .library( name: "Data",targets: ["Data"]),
        .library( name: "Presentation",targets: ["Presentation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "5.3.1"),
        .package(url: "https://github.com/pocketsvg/PocketSVG.git", .upToNextMajor(from: "2.6.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "CryptoUIKit", dependencies: ["Kingfisher", "PocketSVG"]),
        
        .target(name: "Domain", dependencies: []),
        .testTarget(name: "DomainTest", dependencies: ["Domain"]),
        
        .target(name: "Data",
                dependencies: ["Domain"],
                resources: [.process("Resources/data.json")]
               ),
        .testTarget(name: "DataTest",
                    dependencies: ["Data"],
                    resources: [.process("JSONFileReader/json_file_reader_test.json")]
                   ),
        
        .target(name: "Presentation",
                dependencies: ["Domain", "CryptoUIKit"]
               ),
        .testTarget(name: "PresentationTest", dependencies: ["Presentation"]),
    ]
)
