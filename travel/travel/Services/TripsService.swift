//
//  TripsService.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class TripsService {
    
    func doesUsersTripsExist(completion: @escaping ((TripsResponse) -> Void)) {
        let db = Firestore.firestore()
        
        db.collection("usersPublicTrips").getDocuments { (documents, err) in
            if err != nil {
                print("No trips yet")
                completion(.failure("No documents"))
                return
            } else {
                if documents!.documents.isEmpty {
                    completion(.failure("No documents"))
                    return
                } else {
                    for document in documents!.documents {
                        print("\(document.documentID)")
                        completion(.success)
                        return
                    }
                }
            }
        }
    }
    
    func doesTripsExist(completion: @escaping ((TripsResponse) -> Void)) {
        let db = Firestore.firestore()
        guard let user = Auth.auth().currentUser else {
            return
        }
        let docRef = db.collection("trips").document("\(user.uid)")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                completion(.success)
                return
            } else {
                completion(.failure("Doesnt exist"))
                return
            }
        }
    }
    
    func getUserTrip() {
        
    }
}
