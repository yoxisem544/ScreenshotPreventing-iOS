//
//  TagView.swift
//  Demo
//
//  Created by David on 2022/8/17.
//

import UIKit
import SnapKit

final class TagView: UIView {

    // MARK: - ๐ Constants
    // MARK: - ๐ถ Properties

    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }

    var word: String = "" {
        didSet {
            wordLabel.text = word
        }
    }

    // MARK: - ๐จ Style
    // MARK: - ๐งฉ Subviews

    private let numberContainer = UIView()
    private let numberLabel = UILabel()
    private let wordLabel = UILabel()

    // MARK: - ๐ Actions
    // MARK: - ๐จ Initialization

    convenience init() {
        self.init(frame: .zero)
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ๐ผ View Lifecycle

    // MARK: - ๐ UI

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

    // MARK: - ๐ Public Methods
    // MARK: - ๐ Private Methods

}

// MARK: - ๐งถ Extensions


