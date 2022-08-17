# ScreenshotPreventing

## Requirement

- iOS 12+

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build SnapKit using Swift Package Manager.

To integrate SnapKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yoxisem544/ScreenshotPreventing.git", .upToNextMajor(from: "1.0.2"))
]
```

## Demo Project

Clone this project, then

```shell
cd ScreenshotPreventing
open Demo/Demo.xcodeproj
```

Then build for any iOS simulator to test this out.

By triggering screenshot on simulator, look for `Simulator > Device > Trigger Screenshot`.

<img src="./Assets/demo.gif" width="470" />

## Example

You can wrap view you don't want to be screenshot inside `ScreenshotPreventingView`

```swift
import UIKit
import ScreenshotPreventing

class ViewController: UIViewController {

    let stack = UIStackView()
    let container = ScreenshotPreventingView(contentView: stack)

    override func viewDidLoad() {
        super.viewDidLoad()

        // add to subview here.
    }
}
```

Or you can setup content view later.

```swift
import UIKit
import ScreenshotPreventing

class ViewController: UIViewController {

    let stack = UIStackView()
    let container = ScreenshotPreventingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // add to subview here.
        container.setup(contentView: stack)
    }
}
```