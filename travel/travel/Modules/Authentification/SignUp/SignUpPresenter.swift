//
//  SignUpPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

class SignUpPresenter: SignUpViewOutput {
    
    var didSignUp: (() -> Void)?
    let registrationService = RegistrationService()
    weak var viewController: SignUpViewController?
    
    
    func signUp(email: String, password: String, passwordConfirm: String, username: String) {
        registrationService.signUp(email: email, password: password, passwordConfirm: passwordConfirm, username: username) { response in
            switch response {
            case .failure(let message):
                print(message)
                self.viewController?.showAlert(title: "Failed", message: message)
            case .success:
                print("nice")
                self.viewController?.showAlert(title: "Succeed", message: "You have successfully signed up")
                self.didSignUp?()
            }
        }
    }
}

