//
//  SettingsPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 27.05.2021.
//

import Foundation

class SettingsPresenter {
    let authService = AuthorizationService()
    
    func logOut() {
        authService.logOut { error in
            if let error = error {
                print(error)
                return
            }
            NotificationCenter.default.post(name: .didLogOut, object: nil)
        }
    }
}
