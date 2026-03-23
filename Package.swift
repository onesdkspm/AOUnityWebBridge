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
                .byName(name: "BTWebViewKit"),
                .byName(name: "UnityBridge"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.0-dev-1406143/AOUnityWebBridge.xcframework.zip",
            checksum: "604a050d7b921ee0c2791a8c849f52d125039def1de4526eecad607803830bed"
        ),
        .binaryTarget(
            name: "BTWebViewKit",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.0-dev-1406143/BTWebViewKit.xcframework.zip",
            checksum: "6d1f083a5b1999db02e6b131e78756e14914bf0557c767bf1956f6e7a9d9b68e"
        ),
        .binaryTarget(
            name: "UnityBridge",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/AOUnityWebBridge/2.0.0-dev-1406143/UnityBridge.xcframework.zip",
            checksum: "e60f4084fb6692673766ab4b9a2e64678449bd39f8647c6ef69c10e9d1e80538"
        )
    ]
)
