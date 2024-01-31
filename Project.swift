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
 let localHelper = LocalHelper(name: "MyPlugin")

// Project Definition
let app = Project.app(
    name: "TuistXcodeCloud",
    destinations: .iOS,
    additionalTargets: ["TuistXcodeCloudKit", "TuistXcodeCloudUI"]
)
