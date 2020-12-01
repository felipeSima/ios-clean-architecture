//
//  EmptyPlaceholderView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/27/20.
//

import Foundation
import UIKit

class EmptyDataPlaceholderView: UIView {

    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()

    public lazy var titleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.extraLarge, fontType: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    public lazy var subtitleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.medium, fontType: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(stackView)

        let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 5
        self.stackView.addArrangedSubview(textStackView)

        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
