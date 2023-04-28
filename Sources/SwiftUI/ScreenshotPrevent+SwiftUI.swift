//
//  ScreenshotPrevent+SwiftUI.swift
//  
//
//  Created by David on 2023/4/28.
//

#if canImport(SwiftUI)
import SwiftUI
import UIKit
import ScreenshotPreventing

@available(iOS 13.0, *)
/// Internal screen shot wrapper view
struct _ScreenshotPreventView<Content: View>: UIViewControllerRepresentable {

    typealias UIViewControllerType = ScreenshotPreventingHostingViewController<Content>

    private var preventScreenCapture: Bool
    private let content: () -> Content

    init(preventScreenCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.preventScreenCapture = preventScreenCapture
        self.content = content
    }

    func makeUIViewController(context: Context) -> UIViewControllerType {
        ScreenshotPreventingHostingViewController(preventScreenCapture: preventScreenCapture, content: content)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.preventScreenCapture = preventScreenCapture
    }
}

@available(iOS 13.0, *)
public struct ScreenshotPrevent<Content: View>: View {

    private var isProtected: Bool
    private let content: () -> Content

    public init(isProtected: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.isProtected = isProtected
        self.content = content
    }

    public var body: some View {
        _ScreenshotPreventView(preventScreenCapture: isProtected) {
            content()
        }
    }
}

#endif
