//
//  ScreenshotPreventingView+Hosting.swift
//  
//
//  Created by David on 2023/4/28.
//

#if canImport(SwiftUI)
import SwiftUI
import UIKit
import ScreenshotPreventing

@available(iOS 13.0, *)
final class ScreenshotPreventingHostingViewController<Content: View>: UIViewController {

    private let content: () -> Content
    private let wrapperView = ScreenshotPreventingView()

    var preventScreenCapture: Bool = true {
        didSet {
            wrapperView.preventScreenCapture = preventScreenCapture
        }
    }

    init(preventScreenCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.preventScreenCapture = preventScreenCapture
        self.content = content
        super.init(nibName: nil, bundle: nil)

        setupUI()
        wrapperView.preventScreenCapture = preventScreenCapture
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.addSubview(wrapperView)
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wrapperView.topAnchor.constraint(equalTo: view.topAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let hostVC = UIHostingController(rootView: content())
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        hostVC.view.backgroundColor = .clear

        addChild(hostVC)
        wrapperView.setup(contentView: hostVC.view)
        hostVC.didMove(toParent: self)
    }
}

#endif
