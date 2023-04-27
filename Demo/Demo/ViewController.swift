//
//  ViewController.swift
//  Demo
//
//  Created by David on 2022/8/17.
//

import UIKit
import SnapKit
import ScreenshotPreventing

class ViewController: UIViewController {

    let stack = UIView.hstack([], spacing: 24, distribution: .fillEqually)
    lazy var screenshotPreventView = ScreenshotPreventingView(contentView: stack)
//    lazy var screenshotPreventView = ScreenshotPreventingView(contentView: tableView) // you can use this to test scrolling cases

    let toggleSwitch = UISwitch()
    let hintLabel = UILabel()

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(toggleSwitch)
        toggleSwitch.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
        toggleSwitch.addTarget(self, action: #selector(hello(_:)), for: .valueChanged)

        view.addSubview(hintLabel)
        hintLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(toggleSwitch.snp.top).offset(-24)
        }
        hintLabel.textAlignment = .center

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

        view.addSubview(screenshotPreventView)
        screenshotPreventView.translatesAutoresizingMaskIntoConstraints = false
        screenshotPreventView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.bottom.equalTo(hintLabel.snp.top).offset(-12).priority(.low)
        }

        toggleSwitch.isOn = screenshotPreventView.preventScreenCapture
        hintLabel.text = "prevent capture \(toggleSwitch.isOn)"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func hello(_ aSwitch: UISwitch) {
        screenshotPreventView.preventScreenCapture = aSwitch.isOn
        hintLabel.text = "prevent capture \(aSwitch.isOn)"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
