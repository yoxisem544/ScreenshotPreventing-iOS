//
//  ScreenshotPrevent+ViewModifier.swift
//  
//
//  Created by David on 2023/4/28.
//

#if canImport(SwiftUI)
import SwiftUI
import ScreenshotPreventing

@available(iOS 13.0, *)
/// View modifier to wrap view inside a screenshot prevented view.
public struct PreventScreenshot: ViewModifier {

    public let isProtected: Bool

    public func body(content: Content) -> some View {
        _ScreenshotPreventView(preventScreenCapture: isProtected) {
            content
        }
    }
}

@available(iOS 13.0, *)
public extension View {

    /// A view extension to wrap view inside a screenshot protected view.
    /// - Parameter isProtected: whether or not to protect view from being screenshot.
    /// - Returns: wrapped view
    func screenshotProtected(isProtected: Bool) -> some View {
        modifier(PreventScreenshot(isProtected: isProtected))
    }
}

#endif
