// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "SwiftUIWeeklyLayoutChallenge",
    defaultLocalization: "ja",
    platforms: [.iOS(.v15), .macOS(.v12), .macCatalyst(.v14), .tvOS(.v15), .watchOS(.v8)],
    products: [
        .library(
            name: "SwiftUIWeeklyLayoutChallenge",
            targets: ["SwiftUIWeeklyLayoutChallenge"]),
    ],
    targets: [
        .target(
            name: "SwiftUIWeeklyLayoutChallenge",
            path: "."),
    ]
)
