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
        .package(url: "https://github.com/onesdkspm/BTWebViewKit.git", from: "2.0.2"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.2"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.2-dev-1481096/AOUnityWebBridge.xcframework.zip",
            checksum: "1ea09e9367f240fdd29793622275eb1fc77f0d56bc8f21be995d27d19d139889"
        )
    ]
)
