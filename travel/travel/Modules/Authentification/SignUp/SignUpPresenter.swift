//
//  SignUpPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

class SignUpPresenter {
    
    private let registrationService = RegistrationService()
}

extension SignUpPresenter: SignUpViewOutput {
    func signUp(email: String, password: String, passwordConfirm: String) {
        registrationService.signUp(email: email, password: password, passwordConfirm: passwordConfirm) { response in
            switch response {
            case .failure(let message):
                print(message)
            case .success:
                print("zaebis")
            }
        }
    }
}
