//
//  InputView.swift
//  showcase-ios
//
//  Created by Brenda Lau on 19/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

protocol InputViewDelegate: class {
    func inputView(_ inputView: InputView, didSelect value: String, inputType: InputView.InputType)
}

class InputView: UIView {
    enum InputType {
        case toggle
        case stepper(minValue: Double, maxValue: Double)
        case slider(minValue: Float, maxValue: Float)
        case text(placeholder: String)
        case picker(values: [String])
    }

    private var stackView = UIStackView()
    private var titleLabel = UILabel()

    private var values: [String] = []

    public func configure(title: String, inputType: InputType, values: [String] = []) {
        self.resetView()

        titleLabel.text = title
        stackView.addArrangedSubview(titleLabel)

        switch inputType {
        case .toggle:
            let toggleSwitch = UISwitch()
            stackView.addArrangedSubview(toggleSwitch)

        case let .stepper(minValue, maxValue):
            let stepper = UIStepper()
            stepper.minimumValue = minValue
            stepper.maximumValue = maxValue
            stackView.addArrangedSubview(stepper)

        case let .slider(minValue, maxValue):
            let slider = UISlider()
            slider.minimumValue = minValue
            slider.maximumValue = maxValue
            stackView.addArrangedSubview(slider)

        case let .text(placeholder):
            let textField = UITextField()
            textField.placeholder = placeholder
            stackView.addArrangedSubview(textField)

        case let .picker(values):
            let pickerView = UIPickerView()
            pickerView.dataSource = self
            self.values = values
            pickerView.reloadAllComponents()
        }
    }

    private func resetView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        stackView.axis = .horizontal

        values.removeAll()
        titleLabel.text = nil
    }

    private func configureHierarchy() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.fitToSuperview(padding: 20)
    }
}

// MARK: - UIPickerViewDataSource
extension InputView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.values.count
    }
}
