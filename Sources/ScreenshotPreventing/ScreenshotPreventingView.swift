//
//  ScreenshotPreventingView.swift
//
//
//  Created by David on 2022/8/17.
//

import UIKit

public final class ScreenshotPreventingView: UIView {

    // MARK: - 🔶 Properties

    public var preventScreenCapture = true {
        didSet {
            textField.isSecureTextEntry = preventScreenCapture
        }
    }

    // MARK: - 🧩 Subviews

    private var contentView: UIView?

    private let textField = UITextField()

    private lazy var hiddenContentContainer: UIView? = try? recognizer.getHiddenContainer(from: textField)

    // MARK: - 👆 Actions

    private let recognizer = HiddenContainerRecognizer()

    // MARK: - 🔨 Initialization

    public init(contentView: UIView? = nil) {
        self.contentView = contentView
        super.init(frame: .zero)

        setupUI()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 🏗 UI

    private func setupUI() {
        textField.backgroundColor = .clear
        textField.isUserInteractionEnabled = false

        guard let container = hiddenContentContainer else {
            // If not recognize de hidden Container you can use an contentView

            guard let contentView = contentView else { return }
            addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
                contentView.topAnchor.constraint(equalTo: topAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            return
        }

        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        guard let contentView = contentView else { return }
        setup(contentView: contentView)

        DispatchQueue.main.async {
            // setting secure text entry in init block will fail
            // setting default value inside main thread
            self.preventScreenCapture = true
        }
    }

    // MARK: - 🚌 Public Methods

    public func setup(contentView: UIView) {
        self.contentView?.removeFromSuperview()
        self.contentView = contentView

        guard let container = hiddenContentContainer else { return }

        container.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        let bottomConstraint = contentView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        bottomConstraint.priority = .required - 1

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: container.topAnchor),
            bottomConstraint
        ])
    }
}
