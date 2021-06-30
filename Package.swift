// swift-tools-version:5.3
/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 *
 * This package includes unmodified sourcecode for zlib.
 * https://zlib.net/
 *
 * This package includes unmodified sourcecode for libpng.
 * http://www.libpng.org/
 */

import PackageDescription

var cSettings: [CSetting]? {
    var settings: [CSetting] = []
    
    #if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    settings.append(.define("Z_HAVE_UNISTD_H"))
    #endif
    
    settings.append(.unsafeFlags(["-Ofast"], .when(configuration: .release)))
    return settings
}

let package = Package(
    name: "LibPNG",
    products: [
        .library(name: "LibPNG", targets: ["LibPNG"])
    ],
    targets: [
        .target(name: "LibPNG",
                path: "./Sources/LibPNG",
                publicHeadersPath: "Include",
                cSettings: cSettings),
    ],
    cLanguageStandard: .gnu11
)
