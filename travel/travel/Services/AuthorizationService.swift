//
//  AuthorizationService.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

import Firebase
import FirebaseAuth

class AuthorizationService {
    
    func signIn(email: String, password: String,completion: @escaping ((AuthResponse) -> Void)) {
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: trimmedEmail, password: trimmedPassword) { (result,err) in
            guard err == nil else {
                if let errorCode = AuthErrorCode(rawValue: err!._code) {
                    completion(.failure(errorCode.errorMessage))
                }
                return
            }
            completion(.success)
            return
        }
    }
    
    func getUsername() -> String {
        let currentUser = Auth.auth().currentUser
        guard let username = currentUser?.displayName else { return "" }
        return username
    }
    
    func logOut(completion: @escaping (Error?) -> Void) {
        let user = Auth.auth()
        do {
            try user.signOut()
            completion(nil)
        } catch let error as NSError {
            print(error)
            completion(error)
        }
    }
}
