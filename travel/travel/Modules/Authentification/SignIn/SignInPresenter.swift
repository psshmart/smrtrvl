//
//  SignInPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

class SignInPresenter: SignInViewOutput {
    var didSignIn: (() -> Void)?
    
    var authorizationService = AuthorizationService()
    
    weak var viewController: SignInViewController?
    
    func signIn(email: String, password: String) {
        authorizationService.signIn(email: email, password: password) { response in
            switch response {
            case .failure(let message):
                print(message)
                self.viewController?.showAlert(title: "Failed", message: message)
            case .success:
                print("nice")
                self.viewController?.showAlert(title: "Success", message: "You have successfulle signed in")
                self.didSignIn?()
            }
        }
    }
}



