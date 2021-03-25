//
//  SignUpViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 22.03.2021.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {

    var signUpCoordinator: SignUpCoordinator?
    var presenter: SignUpViewOutput?
    var contentView: SignUpView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = SignUpView(frame: view.frame)
        view.addSubview(contentView!)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .white
        addTargets()
    }
    
    private func addTargets() {
        contentView?.registerButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    @objc private func signUp() {
        presenter?.signUp(email: contentView?.usernameTextField.text ?? "", password: contentView?.passwordTextField.text ?? "", passwordConfirm: contentView?.confirmPasswordTextField.text ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeOnNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromNotifications()
    }
    
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

//
}
