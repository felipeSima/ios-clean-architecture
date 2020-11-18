//
//  LoginViewController.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/18/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        self.view.addSubview(loginView)
        layoutView()
    }
    
    func layoutView() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
