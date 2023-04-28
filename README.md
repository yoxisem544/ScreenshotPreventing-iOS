# ScreenshotPreventing

A simple wrapper view that is able to prevent screenshot or screen recording on iOS.

## Requirement

iOS 12+.

SwiftUI will need iOS 13+.

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build ScreenshotPreventing using Swift Package Manager.

To integrate ScreenshotPreventing into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yoxisem544/ScreenshotPreventing.git", .upToNextMajor(from: "1.4.0"))
]
```

### CocoaPods

For ScreenshotPreventing, use the following entry in your Podfile:

```ruby
pod 'ScreenshotPreventing', '~> 1.4.0'
# or 
pod 'ScreenshotPreventing/RxSwift', '~> 1.4.0'
# or SwiftUI
pod 'ScreenshotPreventing/SwiftUI', '~> 1.4.0'
```

## Demo Project

Clone this project, then

```shell
cd ScreenshotPreventing
# For normal demo
open Demo/Demo.xcodeproj
# For SwiftUI demo
open Demo-SwiftUI/Demo-SwiftUI.xcodeproj
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

## SwiftUI Usage

Simply wrap your view inside `ScreenshotPrevent` View. 
You should pass in a isProtected binding to toggle on whether to prevent screenshot or not.

```swift
import SwiftUI
import ScreenshotPreventingSwiftUI

struct ContentView: View {

    @State private var preventScreenshot = false

    var body: some View {
        ScreenshotPrevent(isProtected: preventScreenshot) {
            Text("Hello")
                .padding()
                .background(Color.yellow)
                .cornerRadius(12)
        }
    }
}
```

or using view modifier extension

```swift
import SwiftUI
import ScreenshotPreventingSwiftUI

struct ContentView: View {

    @State private var preventScreenshot = false

    var body: some View {
        Text("Hello")
            .padding()
            .background(Color.yellow)
            .cornerRadius(12)
            .screenshotProtected(isProtected: preventScreenshot)
    }
}
```

## RxSwift Extension

If you use RxSwift in your project, there is a Rx extension to drive `preventScreenCapture` property on `ScreenshotPreventingView`.

Use `RxScreenshotPreventing` package for this extension.

```swift
whetherOrNotToPreventScreenshotObservable
    .bind(to: screenshotPreventingView.rx.preventScreenCapture)
    .disposed(by: bag)
```
