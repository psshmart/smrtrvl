//
//  RegistrationService.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegistrationService {
    
    func signUp(email: String, password: String, passwordConfirm: String, username: String, completion: @escaping ((AuthResponse) -> Void)) {
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPasswordConfirm = passwordConfirm.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedPassword == trimmedPasswordConfirm {
            Auth.auth().createUser(withEmail: trimmedEmail, password: trimmedPassword) { (result, err) in
                guard err == nil else {
                    if let errorCode = AuthErrorCode(rawValue: err!._code) {
                        completion(.failure(errorCode.errorMessage))
                    }
                    return
                }
                
                let user = Auth.auth().currentUser?.createProfileChangeRequest()
                user?.displayName = trimmedUsername
                user?.commitChanges(completion: { error in
                    completion(.failure("Cannot save data"))
                })
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let db = Firestore.firestore()
                let docRef = db.collection("users").document(uid).setData(
                    ["username": trimmedUsername]
                )
                
                completion(.success)
                return
            }
        } else {
            print("lol")
        }
    }
}
