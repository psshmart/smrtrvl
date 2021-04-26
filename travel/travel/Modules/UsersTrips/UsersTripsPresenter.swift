//
//  UsersTripsPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

class UsersTripsPresenter: UsersTripsViewOutput {
    
    var exist: (() -> Void)?
    
    var doesntExist: (() -> Void)?
    
    private var tripsService = TripsService()
    
    func doTripsExist() {
        tripsService.doesUsersTripsExist() { result in
            switch result {
            case .failure(let message):
                print(message)
                self.doesntExist?()
            case .success:
                print("success")
                self.exist?()
            }
        }
    }
    
    
}
