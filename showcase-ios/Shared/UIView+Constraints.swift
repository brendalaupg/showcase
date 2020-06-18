//
//  UIView+Constraints.swift
//  showcase-ios
//
//  Created by Brenda Lau on 18/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

public extension UIView {
    func fitToSuperview(inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = self.superview else {
            return
        }

        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: inset.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: inset.bottom).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset.left).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor, constant: inset.right).isActive = true
    }

    func fitToSuperview(padding: CGFloat) {
        self.fitToSuperview(inset: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
    }
}
