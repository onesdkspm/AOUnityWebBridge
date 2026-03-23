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
        .package(url: "https://github.com/onesdkspm/BTWebViewKit.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "AOUnityWebBridgeWrapper",
            dependencies: [
                .byName(name: "AOUnityWebBridge"),
                .product(name: "BTWebViewKit", package: "BTWebViewKit"),
                .product(name: "UnityBridge", package: "UnityBridge"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.0/AOUnityWebBridge.xcframework.zip",
            checksum: "11aa2779aa71c2c98faf6a71f5d9632ad52c944eb745d754840ad2f729d46f4d"
        )
    ]
)
