//
//  ViewController.swift
//  Demo
//
//  Created by David on 2022/8/17.
//

import UIKit
import SnapKit
import ScreenshotPreventing

final class ViewController: UIViewController {

    let stack = UIView.hstack([], spacing: 24, distribution: .fillEqually)
    lazy var hello = ScreenshotPreventingView(contentView: stack)

    let aSwitch = UISwitch()
    let yayaLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(aSwitch)
        aSwitch.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
        aSwitch.addTarget(self, action: #selector(hello(_:)), for: .valueChanged)

        view.addSubview(yayaLabel)
        yayaLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(aSwitch.snp.top).offset(-24)
        }
        yayaLabel.textAlignment = .center

        let one = ["a", "b", "c", "d", "e", "f"].enumerated().map { (index, word) -> TagView in
            let hello = TagView()
            hello.number = index + 1
            hello.word = word
            return hello
        }

        let two = ["a", "b", "c", "d", "e", "f"].enumerated().map { (index, word) -> TagView in
            let hello = TagView()
            hello.number = index + 6
            hello.word = word
            return hello
        }

        stack.addArrangedSubview(UIView.vstack(one, spacing: 12))
        stack.addArrangedSubview(UIView.vstack(two, spacing: 12))

        stack.withMargins(.init(top: 12, left: 12, bottom: 12, right: 12))

        stack.layer.cornerCurve = .continuous
        stack.layer.cornerRadius = 24
        stack.backgroundColor = .yellow

        view.addSubview(hello)
        hello.translatesAutoresizingMaskIntoConstraints = false
        hello.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
        }

        aSwitch.isOn = hello.preventScreenCapture
        yayaLabel.text = "prevent capture \(aSwitch.isOn)"
    }

    @objc func hello(_ aSwitch: UISwitch) {
        hello.preventScreenCapture = aSwitch.isOn
        yayaLabel.text = "prevent capture \(aSwitch.isOn)"
    }
}
