//
//  ProfileViewViewModel.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import Foundation 
import FirebaseAuth
import FirebaseFirestore
class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    init() {
    }
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(),
                      error == nil else {return}
                self?.user = User(id: data["id"] as? String ?? "",
                                 name: data["name"] as? String ?? "",
                                 email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
    }
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
}
 
