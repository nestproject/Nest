// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "Nest",
  products: [
    .library(name: "Nest", targets: ["Nest"])
  ],
  targets: [
    .target(
        name: "Nest",
        path: "Sources"
    )
  ]
)
