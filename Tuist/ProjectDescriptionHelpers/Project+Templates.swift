import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, destinations: Destinations, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(name: name,
                                     destinations: destinations,
                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
        
        targets += additionalTargets.flatMap { makeFrameworkTargets(name: $0, destinations: destinations) }
        
        return Project(name: name,
                       organizationName: "Kelvin Harron",
                       targets: targets,
                       additionalFiles: "ci_scripts/**")
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, destinations: Destinations) -> [Target] {
        let sources = Target(name: name,
                             destinations: destinations,
                             product: .framework,
                             bundleId: "com.kelvinharron.\(name)",
                             infoPlist: .default,
                             sources: ["Targets/\(name)/Sources/**"],
                             resources: [],
                             dependencies: [])
        let tests = Target(name: "\(name)Tests",
                           destinations: destinations,
                           product: .unitTests,
                           bundleId: "com.kelvinharron.\(name)Tests",
                           infoPlist: .default,
                           sources: ["Targets/\(name)/Tests/**"],
                           resources: [],
                           dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, destinations: Destinations, dependencies: [TargetDependency]) -> [Target] {
        let infoPlist: [String: Plist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen"
        ]

        let mainTarget = Target(
            name: name,
            destinations: destinations,
            product: .app,
            bundleId: "com.kelvinharron.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "com.kelvinharron.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            scripts: [.pre(path: "ci_scripts/generate-mocks.sh", name: "Generate Mocks", outputPaths: [.init("Targets/TuistXcodeCloud/Sources/GeneratedMocks.swift")] )],
            dependencies: [
                .target(name: "\(name)")
            ]
        )
        return [mainTarget, testTarget]
    }
}
