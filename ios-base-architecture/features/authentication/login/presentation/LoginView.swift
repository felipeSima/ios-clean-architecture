//
//  LoginView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/18/20.
//

import UIKit
import TextFieldEffects
import SnapKit

class LoginView: UIView, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundView)
        self.addSubview(stackView)
        layoutComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutComponents(){
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(Dimensions.spacing)
            make.right.equalToSuperview().inset(Dimensions.spacing)
            make.bottom.equalToSuperview().inset(Dimensions.spacingLarge)
            make.height.greaterThanOrEqualTo(100)
        }
    }
    
    private lazy var  backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        return imageView
    }()
    
    private lazy var usernameField: HoshiTextField = {
        let label = DefaultTextField()
        label.set("Usuário")
        label.delegate = self
        return label
    }()
    
    private lazy var passwordField: DefaultTextField = {
        let label = DefaultTextField()
        label.set("Senha")
        label.delegate = self
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameField, passwordField])
        stackView.axis = .vertical
        stackView.spacing = Dimensions.spacing
        stackView.alignment = .leading
        usernameField.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(Dimensions.buttonHeight)
        }
        passwordField.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(Dimensions.buttonHeight)
        }
        return stackView
    }()
    
}
