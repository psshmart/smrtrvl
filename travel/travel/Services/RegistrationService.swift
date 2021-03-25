//
//  RegistrationService.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import Firebase
import FirebaseAuth

class RegistrationService {
    
    func signUp(email: String, password: String, passwordConfirm: String, completion: @escaping ((AuthResponse) -> Void)) {
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPasswordConfirm = passwordConfirm.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: trimmedEmail, password: trimmedPassword) { (result, err) in
            guard err == nil else {
                completion(.failure("Sosi"))
                return
            }
            completion(.success)
            return
        }
    }
}
