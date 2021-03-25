//
//  SignUpView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

import UIKit
import SnapKit

class SignUpView: ScrollableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 48, style: .bold)
        label.text = "Sign Up"
        label.textColor = UIColor(red: 254/255, green: 241/255, blue: 0/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let confirmPasswordTextField: UITextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let registerButton: UIButton = {
        let button = CustomLoginButton()
        button.setTitle("SignUp", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 23, style: .regular)
        label.text = "username"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 23, style: .regular)
        label.text = "password"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 23, style: .regular)
        label.text = "confirm password"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private func setupView() {

        scrollView.addSubview(signUpLabel)
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(usernameTextField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(confirmPasswordLabel)
        scrollView.addSubview(confirmPasswordTextField)
        scrollView.addSubview(registerButton)

        signUpLabel.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.greaterThanOrEqualTo(321)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.bounds.height * 0.15)
        }

        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(signUpLabel)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.top.equalTo(signUpLabel.snp.bottom).offset(38)
        }

        usernameTextField.snp.makeConstraints {make in
            make.centerX.equalTo(usernameLabel)
            make.width.greaterThanOrEqualTo(265)
            make.height.equalTo(40)
            make.leading.equalTo(self.snp.leading).offset(70)
            make.top.equalTo(usernameLabel.snp.bottom).offset(15)

        }

        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(usernameTextField)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.top.equalTo(usernameTextField.snp.bottom).offset(25)
        }

        passwordTextField.snp.makeConstraints {make in
            make.centerX.equalTo(passwordLabel)
            make.width.greaterThanOrEqualTo(265)
            make.height.equalTo(40)
            make.leading.equalTo(self.snp.leading).offset(70)
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)

        }

        confirmPasswordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(passwordTextField)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }

        confirmPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(confirmPasswordLabel)
            make.width.greaterThanOrEqualTo(265)
            make.height.equalTo(40)
            make.trailing.equalTo(self.snp.trailing).offset(-70)
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(15)
        }

        registerButton.snp.makeConstraints { make in
            make.centerX.equalTo(confirmPasswordTextField)
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(40)
            make.width.greaterThanOrEqualTo(150)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-30)
        }

    }
    
}
