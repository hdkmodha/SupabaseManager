// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension Target.Dependency {
    
    static var supabase: Self {
        .product(
            name: "Supabase",
            package: "supabase-swift"
        )
    }
    
}

let package = Package(
    name: "SupabaseManager",
    platforms: [.iOS(.v17)],
    products: [
        
        .library(
            name: "AuthManager",
            targets: ["AuthManager"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/supabase/supabase-swift.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "AuthManager",
            dependencies: ["SupabaseManager"]
        ),
        .target(
            name: "SupabaseManager",
            dependencies: [.supabase]
        )
    ]
)
