//
//  TagView.swift
//  Demo
//
//  Created by David on 2022/8/17.
//

import SnapKit
import UIKit

final class TagView: UIView {

    // MARK: - 🔶 Properties

    var number = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }

    var word = "" {
        didSet {
            wordLabel.text = word
        }
    }

    // MARK: - 🧩 Subviews

    private let numberContainer = UIView()
    private let numberLabel = UILabel()
    private let wordLabel = UILabel()

    // MARK: - 🔨 Initialization

    convenience init() {
        self.init(frame: .zero)
    }

    override private init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 🏗 UI

    private func setupUI() {
        addSubview(numberContainer)
        numberContainer.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.leading.top.bottom.equalToSuperview()
        }
        numberContainer.backgroundColor = .lightGray
        numberContainer.layer.cornerRadius = 12

        numberContainer.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: 12, weight: .medium)

        addSubview(wordLabel)
        wordLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(numberContainer.snp.trailing).offset(12)
        }
        wordLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
}
