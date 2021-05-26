//
//  SignInView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

import UIKit

class SignInView: ScrollableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

    let loginButton: UIButton = {
        let button = CustomLoginButton()
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    let signUpButton: UIButton = {
        let button = CustomSignUpButton()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 48, style: .regular)
        label.text = "Sign In"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let minLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 20, style: .regular)
        label.text = "or"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 25, style: .regular)
        label.text = "email"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 25, style: .regular)
        label.text = "password"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView

    }()

    private func setupView() {
        stackView.addArrangedSubview(minLabel)
        stackView.addArrangedSubview(signUpButton)

        scrollView.addSubview(titleLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(usernameTextField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(loginButton)

        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.greaterThanOrEqualTo(321)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.bounds.height * 0.15)
        }

        stackView.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(102)
            make.height.equalTo(60)
            make.centerX.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }

        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(stackView)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.top.equalTo(stackView.snp.bottom).offset(25)
        }

        usernameTextField.snp.makeConstraints {make in
            make.centerX.equalTo(usernameLabel)
            make.width.greaterThanOrEqualTo(265)
            make.height.equalTo(40)
            make.leading.equalTo(self.snp.leading).offset(70)
            make.top.equalTo(usernameLabel.snp.bottom).offset(15)

        }

        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(usernameLabel)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.top.equalTo(usernameTextField.snp.bottom).offset(35)
        }

        passwordTextField.snp.makeConstraints {make in
            make.centerX.equalTo(passwordLabel)
            make.width.greaterThanOrEqualTo(265)
            make.height.equalTo(40)
            make.trailing.equalTo(self.snp.trailing).offset(-70)
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)

        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.width.greaterThanOrEqualTo(150)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    

}
