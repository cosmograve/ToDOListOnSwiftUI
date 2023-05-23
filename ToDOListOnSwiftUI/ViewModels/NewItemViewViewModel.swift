//
//  NewItemViewViewModel.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {
        
    }
    
    func save() {
        guard canSave else {return}
        guard let uId = Auth.auth().currentUser?.uid else {return}
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   tiile: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("toDos")
            .document(newId)
            .setData(newItem.makeDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {return false}
        guard dueDate >= Date().addingTimeInterval(-86400) else {return false}
        return true
    }
}
