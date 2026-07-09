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
        .package(url: "https://github.com/onesdkspm/BTWebViewKit.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.3"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.3-dev-1482676/AOUnityWebBridge.xcframework.zip",
            checksum: "192d5dd488066ce31dbb7bf1411fcd592c35fd93ecd3602b866b9c43f6f98ae2"
        )
    ]
)
