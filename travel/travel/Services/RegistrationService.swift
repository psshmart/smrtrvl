//
//  RegistrationService.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import Firebase
import FirebaseAuth

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
                guard let uid = result?.user.uid else {
                    return completion(.failure("sosi"))
                }
                let db = Firestore.firestore()
                db.collection("users").document(uid).setData([
                    "username" : trimmedUsername
                ]) { error in
                    if error != nil {
                        return completion(.failure("Can't save the data"))
                    }
                }
                completion(.success)
                return
            }
        } else {
            print("lol")
        }
    }
}
