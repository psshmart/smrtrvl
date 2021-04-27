//
//  UserScreenViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit

class UserScreenViewController: UIViewController {
    
    private var backView: BackgroundView?
    var userInfoView: UserInfoView?
    var coordinator: UserScreenRouter?
    var presenter: UserScreenPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        backView = BackgroundView.init(frame: view.frame)
        guard let backView = backView else { return }
        view.addSubview(backView)
        userInfoView = UserInfoView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.4))
        guard let userView = userInfoView else { return }
        view.addSubview(userView)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
