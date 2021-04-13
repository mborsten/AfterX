import PackageDescription
let package = Package(
    name: "AfterX",
    products: [
        .library(
            name: "AfterX",
            targets: ["AfterX"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AfterX",
            dependencies: [],
            path: "AfterX/Classes")
    ]
)
