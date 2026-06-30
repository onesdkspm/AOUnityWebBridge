// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AOUnityWebBridge",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "AOUnityWebBridge",
            targets: ["AOUnityWebBridgeWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/BTWebViewKit.git", branch: "develop"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "1.0.0"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "AOUnityWebBridgeWrapper",
            dependencies: [
                .byName(name: "AOUnityWebBridge"),
                .product(name: "BTWebViewKit", package: "BTWebViewKit"),
                .product(name: "UnityBridge", package: "UnityBridge"),
                .product(name: "BTSDKUIKitCore", package: "BTSDKUIKitCore"),
            ],
            path: "AOUnityWebBridgeWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "AOUnityWebBridge",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/1.1.2-dev-1474836/AOUnityWebBridge.xcframework.zip",
            checksum: "9a9edebfd8417231c7dc128f39c3e6af549a7392f9bcaa99ac4b2d7429689d0d"
        )
    ]
)
