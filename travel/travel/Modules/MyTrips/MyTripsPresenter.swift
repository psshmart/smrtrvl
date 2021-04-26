//
//  MyTripsPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

class MyTripsPresenter: TripsViewOutput {
    
//    weak var view: TripsViewInput?
    
    var exist: (() -> Void)?
    
    var doesntExist: (() -> Void)?
    
    var tripsService = TripsService()
    
//    init(view: MyTripsPresenter) {
//        self.view = view
//    }
    
    func doesTripExist() {
        tripsService.doesTripsExist() { result in
            switch result {
            case .failure(let message):
                print(message)
                self.doesntExist?()
            case .success:
                self.exist?()
                
            }
            
            
        }
        
    }
    
    func viewDidLoad() {
//        self.getTrips()
//        self.view.models = models
//        self.view.tablleview.reloaddata
    }
    
    private func getTrips() {
        print("get trips!!!")
    }
    
}
