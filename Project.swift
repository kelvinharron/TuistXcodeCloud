import MyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains TuistXcodeCloud App target and TuistXcodeCloud unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

//// Local plugin loaded
// let localHelper = LocalHelper(name: "MyPlugin")

// Project Definition
let app = Project.app(
    name: "TuistXcodeCloud",
    destinations: .iOS,
    additionalTargets: ["TuistXcodeCloudKit", "TuistXcodeCloudUI"]
)

//
//
//
//// Creates our project using a helper function defined in ProjectDescriptionHelpers
// let project = Project(name: "TuistXcodeCloud",
//                      destinations: .iOS,
//                      additionalTargets: ["TuistXcodeCloudKit", "TuistXcodeCloudUI"],)

let generateMockScript: TargetScript = .pre(path: "ci_scripts/generate-mocks.sh", name: "Generate Mocks", outputPaths: [.init("Targets/TuistXcodeCloud/Sources/GeneratedMocks.swift")])
//
// let appTarget = Target(
//    name: "EHR",
//    destinations: [.iPad, .macWithiPadDesign],
//    product: .app,
//    bundleId: "co.eso.esoehr",
//    deploymentTargets: .iOS("17.0"),
//    infoPlist: .file(path: "Targets/EHR/Sources/Config/info.plist"),
//    sources: ["Targets/EHR/Sources/**"],
//    resources: ["Targets/EHR/Resources/**"],
//    scripts: [lintScript],
//    dependencies: [
//        .package(product: "Factory", type: .runtime),
//        .package(product: "Gzip", type: .runtime),
//        .package(product: "KeychainSwift", type: .runtime),
//        .package(product: "Realm", type: .runtime),
//        .package(product: "RealmSwift", type: .runtime),
//        .package(product: "SwiftUIIntrospect", type: .runtime)
//    ],
//    settings: .settings(configurations: [releaseConfiguration, debugConfiguration])
// )
//
// let testTarget = Target(
//    name: "EHRTests",
//    destinations: [.iPad, .macWithiPadDesign],
//    product: .unitTests,
//    bundleId: "co.eso.esoehr.test",
//    deploymentTargets: .iOS("17.0"),
//    infoPlist: .default,
//    sources: ["Targets/EHRTests/Sources/**"],
//    resources: ["Targets/EHRTests/Resources/**"],
//    scripts: [generateMockScript],
//    dependencies: [
//        .package(product: "Quick", type: .runtime),
//        .package(product: "Nimble", type: .runtime),
//        .project(target: "EHR", path: ".")
//    ],
//    settings: .settings(configurations: [unitTestConfig])
// )
//
// let options: Project.Options = .options(
//    automaticSchemesOptions: .enabled(
//        targetSchemesGrouping: .notGrouped,
//        codeCoverageEnabled: true,
//        testingOptions: .randomExecutionOrdering
//    )
// )
//
//// Project Definition
// let project = Project(
//    name: "EHR",
//    organizationName: "ESO Solutions, Inc.",
//    options: options,
//    packages: mainDependencies + testDependencies,
//    settings: projectSettings,
//    targets: [appTarget, testTarget],
//    additionalFiles: [
//        ".swiftFormat",
//        ".swiftlint.yml",
//        "ci_scripts/**",
//        "TestFlight/**"
//    ]
// )
