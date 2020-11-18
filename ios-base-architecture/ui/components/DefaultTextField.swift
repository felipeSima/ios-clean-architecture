//
//  DefaultTextField.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/18/20.
//

import UIKit
import TextFieldEffects
import SnapKit

class DefaultTextField: HoshiTextField {
    
    let textField: HoshiTextField = {
        let label = HoshiTextField()
        label.placeholder = NSLocalizedString("login_password", comment: "")
        label.placeholderColor = .white
        label.placeholderFontScale = 0.9
        label.placeholderLabel.font = UIFont.defaultRegularFont(ofSize: UIFont.small)
        label.textColor = .white
        label.borderInactiveColor = .white
        label.font = UIFont.defaultRegularFont(ofSize: UIFont.medium)
        label.returnKeyType = .done
        label.keyboardType = .phonePad
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textField)
        layoutComponent()
    }
    
    func set(_ placeholderTitle: String){
        textField.placeholder = placeholderTitle
    }
    
    func layoutComponent() {
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
