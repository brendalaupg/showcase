//
//  ControlView.swift
//  showcase-ios
//
//  Created by Brenda Lau on 19/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

class ControlView: UIView {
    // MARK: - Variables
    private var stackView = UIStackView()

    public func configure(inputViews: [InputView]) {
        self.resetView()

        inputViews.forEach { inputView in
            self.stackView.addArrangedSubview(inputView)
        }
    }

    private func resetView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        stackView.axis = .vertical
    }
}
