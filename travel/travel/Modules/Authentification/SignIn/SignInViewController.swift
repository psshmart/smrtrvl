//
//  SignInViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    var signInCoordinator: SignInRouter?
    var contentView: SignInView?
    var presenter: SignInPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = SignInView(frame: view.frame)
        view.addSubview(contentView!)
        self.navigationController?.isNavigationBarHidden = true
        contentView?.signUpButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        addTargets()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeOnNotification()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromNotifications()
    }
    
    private func addTargets() {
        contentView?.loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    // MARK: - SignIn
    @objc private func signIn() {
        presenter?.signIn(email: contentView?.usernameTextField.text ?? "", password: contentView?.passwordTextField.text ?? "")
    }
    
    // MARK: - Alerts
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Funcs for scrollview
    
    @objc private func keyboardWasShown(notification: Notification) {
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

           contentView?.scrollView.contentInset = contentInsets
           contentView?.scrollView.scrollIndicatorInsets = contentInsets
       }

    @objc private func keyboardWillBeHidden(notification: Notification) {
           let contentInsets = UIEdgeInsets.zero
           contentView?.scrollView.contentInset = contentInsets
       }

    private func subscribeOnNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func unsubscribeFromNotifications() {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    @objc private func didTapButton() {
        signInCoordinator?.getSignUpViewController()
    }
}


